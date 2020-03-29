import pytest
import socket
import application as app

@pytest.fixture
def client():
    app.app.config['TESTING'] = True
    return app.app.test_client()

def test_hello():
    assert app.hello() == "Hello! I am the container: {}\n".format(socket.gethostname())

def test_hello_request(client):
    assert client.get("/hello").data.decode() == "Hello! I am the container: {}\n".format(socket.gethostname())
