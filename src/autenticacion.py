from flask import jsonify, request
import jwt
from datetime import datetime, timedelta


def crear_token(data:dict):
    try:
        now =datetime.now()
        nueva_fecha= now +timedelta(1)
        token = jwt.encode(payload={**data,"exp":nueva_fecha},key="hola",algorithm="HS256")
        return token.encode("UTF-8")
    except Exception as ex:
        print(ex)
        return jsonify({"mensaje":"Error "})

def valida_token(token,salida=False):
    try:
        if salida:
            return jwt.decode(token,key="hola",algorithms=["HS256"])
        jwt.decode(token,key="hola",algorithms=["HS256"])
    except jwt.DecodeError as ex:
        response =jsonify({"mensaje":"token invalido"})
        response.status_code =401
        print(ex)
        return response
    except jwt.ExpiredSignatureError as e:
        print(e)
        response =jsonify({"mensaje":"token expiró"})
        response.status_code =401
        return response

def verificar_token():
    token = request.headers['Authorization'].split(" ")[1]
    return valida_token(token,salida=True)
