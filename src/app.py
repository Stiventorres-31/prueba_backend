from flask import Flask, jsonify, request
from flask_mysqldb import MySQL
from config import config
from autenticacion import *


app = Flask(__name__)
conexion = MySQL(app)

# ____________ INICIAR SESIÓIN ____________#


@app.route("/iniciar_sesion", methods=["POST"])
def iniciar_sesion():

    try:
        cursor = conexion.connection.cursor()
        sql = "SELECT id_usuario,pass FROM usuarios where usuario='{0}'".format(
            request.json['usuario'])
        cursor.execute(sql)
        datos = cursor.fetchone()
        if datos != None:
            if datos[1] !=request.json['pass']:
                return jsonify({"mensaje": "Contraseña incorrecta"}),500
            else:
                payload = {
                    "id_usuario": datos[0],
                    "usuario": request.json["usuario"]
                }

        return crear_token(payload)
    except Exception as ex:
        print(ex)
        return jsonify({"mensaje": "Error al iniciar sesión"}),500

# ____________ REGISTRAR USUARIO ____________#
@app.route("/registrar_usuarios", methods=['POST'])
def registrar_usuarios():
    # LISTO
    token = request.headers['Authorization'].split(" ")[1]
    respuesta = valida_token(token, salida=False)
    if respuesta == 'HTTP_AUTHORIZATION':
        return jsonify({"mensaje": "No estas autorizado para realizar esta operación"}),500
    else:
        try:
            print(respuesta)
            cursor = conexion.connection.cursor()
            sql = """insert into usuarios(nombre_usuario,usuario,pass)
            values('{0}','{1}','{2}')""".format(request.json['nombre_usuario'],
                                                request.json['usuario'], request.json['pass'])

            cursor.execute(sql)
            conexion.connection.commit()  # CONFIRMA LA INSERCION
            lastId = cursor.lastrowid
            return jsonify({"mensaje": "Usuario registrado","id_usuario_registrado":lastId}),200
        except Exception as ex:
            print(ex)
            error = {"mensaje": "Error al registrar usuario, verifique los datos"}
            return jsonify(error),500

# ____________ REGISTRAR PRODUCTOS ____________#
@app.route("/registrar_productos", methods=['POST'])
def registrar_productos():
   
    token = request.headers['Authorization'].split(" ")[1]
    respuesta = valida_token(token, salida=False)
    if respuesta == 'HTTP_AUTHORIZATION':
        
        return jsonify({"mensaje": "No estas autorizado para realizar esta operación"}),500
    else:
        try:
            tokens = valida_token(token, salida=True)
           
            codigo_producto =request.json['codigo_producto']
            nombre_producto = request.json['nombre_producto']
            id_establecimiento_fk=request.json['id_establecimiento']
            id_portafolio_fk = request.json['id_portafolio_fk']
            id_usuario_registrador_fk = tokens['id_usuario']

            cursor = conexion.connection.cursor()
            sql_producto = """insert into productos(codigo_producto,nombre_producto,id_establecimiento_fk,id_portafolio_fk,id_usuario_registrador_fk)
            values('{0}','{1}',{2},{3},{4})""".format(codigo_producto,nombre_producto,
                        id_establecimiento_fk,id_portafolio_fk,id_usuario_registrador_fk)

            cursor.execute(sql_producto)
            conexion.connection.commit()  # CONFIRMA LA INSERCION
            lastId = cursor.lastrowid
            return jsonify({"mensaje": "producto registrado","id_insertado":lastId}),200
        except Exception as ex:
            print(ex)
            return jsonify({"mensaje": "Error al registrar producto, verifique los datos"}),500

#____________ REGISTRAR PORTAFOLIOS ____________#
@app.route("/registrar_portafolio",methods=['POST'])
def registrar_portafolio():
    token = request.headers['Authorization'].split(" ")[1]
    respuesta = valida_token(token, salida=False)
    if respuesta == 'HTTP_AUTHORIZATION':
        return jsonify({"mensaje": "No estas autorizado para realizar esta operación"}),500
    else:
        try:
            codigo_portafolio=request.json['codigo_portafolio']
            nombre_portafolio=request.json['nombre_portafolio']
            cursor = conexion.connection.cursor()
            sql = """insert into portafolios(codigo_portafolio,nombre_portafolio) 
            values('{0}','{1}')""".format(codigo_portafolio,
                                                nombre_portafolio)

            cursor.execute(sql)
            conexion.connection.commit()  # CONFIRMA LA INSERCION
            lastId = cursor.lastrowid
            return jsonify({"mensaje":"Portafolio registrado","id_insertado":lastId}),200
        except Exception as ex:
            print(ex)
            return jsonify({"mensaje": "Error al registrar portafolio, verifique los datos"}),500

#____________ REGISTRAR ESTABLECIMIENTO ____________#
@app.route("/registrar_establecimiento",methods=['POST'])
def registrar_establecimiento():
    token = request.headers['Authorization'].split(" ")[1]
    respuesta = valida_token(token, salida=False)
    if respuesta == 'HTTP_AUTHORIZATION':
        return jsonify({"mensaje": "No estas autorizado para realizar esta operación"})
    else:
        try:
            codigo_establecimiento=request.json['codigo_establecimiento']
            nombre_establecimiento=request.json['nombre_establecimiento']
            cursor = conexion.connection.cursor()
            sql = """insert into establecimientos(codigo_establecimiento,nombre_establecimiento) 
            values('{0}','{1}')""".format(codigo_establecimiento,
                                                nombre_establecimiento)

            cursor.execute(sql)
            conexion.connection.commit()
            lastId = cursor.lastrowid
            return jsonify({"mensaje":"Establecimiento registrado","id_insertado":lastId}),200
          
        except Exception as ex:
            print(ex)
            return jsonify({"mensaje":"Error al registrar establecimiento, verifique los datos"}),500

#____________ CONSULTAR POR CATALOGO ____________#
@app.route("/consular_productos_catalogo/<id_portafolio>",methods=["GET"])
def mostrar(id_portafolio:int):
    token = request.headers['Authorization'].split(" ")[1]
    respuesta = valida_token(token, salida=False)
    if respuesta == 'HTTP_AUTHORIZATION':
        return jsonify({"mensaje": "No estas autorizado para realizar esta operación"})
    else:
        try:
            cursor=conexion.connection.cursor()
            sql="select * from productos where id_portafolio_fk='{0}'".format(id_portafolio)
            cursor.execute(sql)
            datos=cursor.fetchall()
            productos=[]
            for dato in datos:
                producto={
                    "id_producto":dato[0],
                    'codigo_producto':dato[1],
                    'nombre_producto':dato[2],
                    'id_establecimiento_fk':dato[3],
                    'id_portafolio_fk':dato[4],
                    'id_usuario_registrado_fk':dato[5]
                }
                productos.append(producto)
            return jsonify({"productos":productos}),200
        except Exception as ex:
            return jsonify({"mensaje":"ERROR"}),500

#____________ DISCRIMINADO POR CATALOGO ____________#
@app.route("/discriminado_catalogo/<id_portafolio>",methods=["GET"])
def discriminado_catalogo(id_portafolio:int):
    token = request.headers['Authorization'].split(" ")[1]
    respuesta = valida_token(token, salida=False)
    if respuesta == 'HTTP_AUTHORIZATION':
        return jsonify({"mensaje": "No estas autorizado para realizar esta operación"})
    else:
        try:
            cursor=conexion.connection.cursor()
            sql="select * from productos where not id_portafolio_fk='{0}'".format(id_portafolio)
            cursor.execute(sql)
            datos=cursor.fetchall()
            productos=[]
            for dato in datos:
                producto={
                    "id_producto":dato[0],
                    'codigo_producto':dato[1],
                    'nombre_producto':dato[2],
                    'id_establecimiento_fk':dato[3],
                    'id_portafolio_fk':dato[4],
                    'id_usuario_registrado_fk':dato[5]
                }
                productos.append(producto)
            return jsonify({"productos":productos}),200
        except Exception as ex:
            return jsonify({"mensaje":"ERROR"}),500

#____________ MOSTRAR FOTO LOS PRODUCTOS ____________#
@app.route("/")
def mostrar_todo():
    token = request.headers['Authorization'].split(" ")[1]
    respuesta = valida_token(token, salida=False)
    if respuesta == 'HTTP_AUTHORIZATION':
        return jsonify({"mensaje": "No estas autorizado para realizar esta operación"})
    else:
        try:
            cursor=conexion.connection.cursor()
            sql="select * from productos"
            cursor.execute(sql)
            datos=cursor.fetchall()
            productos=[]
            for dato in datos:
                producto={
                    "id_producto":dato[0],
                    'codigo_producto':dato[1],
                    'nombre_producto':dato[2],
                    'id_establecimiento_fk':dato[3],
                    'id_portafolio_fk':dato[4],
                    'id_usuario_registrado_fk':dato[5]
                }
                productos.append(producto)
            return jsonify({"productos":productos}),200
        except Exception as ex:
            return jsonify({"mensaje":"ERROR"}),500

#____________ PÁGINA NO ENCONTRADO ____________#
def pagina_no_encontrada(error):
    return "<h1>LA PAGINA NO EXISTE</h1>"

if __name__ == '__main__':
    app.config.from_object(config['development'])
    app.register_error_handler(404, pagina_no_encontrada)
    app.run()
