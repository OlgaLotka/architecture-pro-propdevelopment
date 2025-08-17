import json
import re
from flask import Flask

app = Flask(__name__)

config_pattern = re.compile('audit-policy')
res = []

def privilegedPod(res2):
    try:
        res5 =  res2["requestObject"]
        res6 =  res5["spec"]
        res7 =  res6["containers"][0]
        res8 = res7["securityContext"]
        return res8["privileged"]
    except KeyError as ke:
        return 'default'
    
def execPod(res3) :
    try:
        return res3["subresource"]
    except KeyError as ke:
        return 'default'   

if __name__ == '__main__':
    with app.app_context():
        f = open('audit.log','r')
        with f as file:
            data = file.readlines()
            for line in data:
                
                res2 = json.loads(line)
                # audit
                match = config_pattern.search(line)
                if match :
                   res.append(res2)
                #Проверка на события доступа к secrets
                verb = res2["verb"]
                res3 = res2["objectRef"]
                resource = res3["resource"] 
                if verb == 'get' and resource == 'secrets' :
                   res.append(res2)

                #Проверка на kubectl exec в чужие поды
                subresource = execPod(res3)

                if verb == 'create' and subresource == 'exec' :
                    res.append(res2)

                #Привилегированные поды                
                privileged = privilegedPod(res2)

                if privileged == True and resource == 'pods':
                   res.append(res2)

    with open('audit-extract.json', 'w', encoding='utf-8') as f1:
        json.dump(res, f1, ensure_ascii=False, indent=4)
    app.run(host="0.0.0.0", port=8084, debug=True) 

