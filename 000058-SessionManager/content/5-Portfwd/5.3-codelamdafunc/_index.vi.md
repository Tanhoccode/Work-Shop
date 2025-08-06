---
title : "Code for Lambda Function"
date : "2024-01-01"
weight : 5 
chapter : false
pre : " <b> 5.3 </b> "
---

Trong bước này chúng ta sẽ thực hiện code python sao cho Lamda Func hoạt động

 1. Ấn vào Code.
![Lamda](/Work-Shop/images/WS/Lamda/EditCode.png)


Dưới đây là đoạn code mẫu python của Lamda Function 


```python
# Import lib
import boto3
import json

# Func
bedrock = boto3.client('bedrock-runtime', region_name='us-east-1')

# Func handle
def lambda_handler(event, context):
    # Handle preflight (OPTIONS) request for CORS
    if event['httpMethod'] == 'OPTIONS':
        return {
            'statusCode': 200,
            'headers': {
                'Access-Control-Allow-Origin': '*',
                'Access-Control-Allow-Headers': '*',
                'Access-Control-Allow-Methods': 'OPTIONS,POST,GET'
            },
            'body': json.dumps('Preflight OK')
        }

    # Parse incoming JSON
    body = json.loads(event['body'])
    user_message = body.get('message', '')
    history = body.get('history', [])

    # Optional: construct prompt with history
    conversation = ""
    for turn in history:
        conversation += f"User: {turn['user']}\nAssistant: {turn['assistant']}\n"
    conversation += f"User: {user_message}\nAssistant:"

    # Create payload for Titan
    request_body = {
        "inputText": conversation,
        "textGenerationConfig": {
            "maxTokenCount": 300,
            "temperature": 0.7,
            "topP": 0.9,
            "stopSequences": []
        }
    }

    # Call Titan model
    response = bedrock.invoke_model(
        modelId='amazon.titan-text-express-v1',
        body=json.dumps(request_body),
        contentType='application/json',
        accept='application/json'
    )

    # Extract model output
    result = json.loads(response['body'].read())
    reply = result.get('results', [{}])[0].get('outputText', '')

    # Return response with CORS headers
    return {
        'statusCode': 200,
        'headers': {
            'Content-Type': 'application/json',
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Headers': '*',
            'Access-Control-Allow-Methods': 'OPTIONS,POST,GET'
        },
        'body': json.dumps({'response': reply})
    } 



{{%notice tip%}}
Lưu ý : hãy dùng đúng mã vùng của bạn 
 region_name='us-east-1'
{{%/notice%}}