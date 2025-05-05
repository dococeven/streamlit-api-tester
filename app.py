import streamlit as st
import requests

# Title of the app
st.title("API Tester")

# Input for API endpoint
#url = st.text_input("Enter API URL", "https://jsonplaceholder.typicode.com/posts/1")
url = st.text_input("Enter API URL", "https://dss-api-p0-shared.prod.macif.fr/public/api/v1/Fraud_Prediction_Service-2/Fraud_Prediction_EP/predict")

# Select HTTP method
method = st.selectbox("Select HTTP Method", ["GET", "POST"])

# Request body input (for POST requests)
request_body = None
if method == "POST":
    request_body = st.text_area("Request Body (JSON)", '{"key": "value"}')

# Button to send the request
if st.button("Send Request"):
    try:
        if method == "GET":
            response = requests.get(url)
        elif method == "POST":
            headers = {"Content-Type": "application/json"}
            response = requests.post(url, data=request_body, headers=headers)
        
        # Display response
        st.subheader("Response")
        st.json(response.json())
        
        # Display status code
        st.write(f"Status Code: `{response.status_code}`")
    
    except Exception as e:
        st.error(f"Error: {e}")