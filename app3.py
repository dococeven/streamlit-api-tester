import requests


# POST request with JSON
headers = {"Content-Type": "application/json"}
data = {"key": "value"}
response = requests.post("https://dss-api-p0-shared.prod.macif.fr/public/api/v1/Fraud_Prediction_Service-2/Fraud_Prediction_EP/predict", json=data, headers=headers)
print(response.text)
