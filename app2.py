import streamlit as st
import requests

API_URL = "https://dss-api-p0-shared.prod.macif.fr/public/api/v1/Fraud_Prediction_Service-2/Fraud_Prediction_EP/predict"  # Use VPN-accessible URL

def fetch_data():
    try:
        response = requests.get(API_URL)
        return response.json()
    except Exception as e:
        st.error(f"API Error: {e}")

data = fetch_data()
st.write(data)