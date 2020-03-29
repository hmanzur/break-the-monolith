import pytest
import socket
import application as app

@pytest.fixture
def client():
    app.app.config['TESTING'] = True
    return app.app.test_client()

def test_user():
    assert app.user() == "Hello User! You are in the container: {}\n".format(socket.gethostname())

def test_user_request(client):
    assert client.get("/user").data.decode() == "Hello User! You are in the container: {}\n".format(socket.gethostname())
