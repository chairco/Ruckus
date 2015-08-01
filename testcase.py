import unittest
import threading
import time
from bottle import Bottle
from mockserver import MockRESTServer
from threading import Thread


class TestServerHandlers(unittest.TestCase):

    server = None
    thread = None

    def setUp(self):
        app = Bottle()
        self.server = MockRESTServer(host="127.0.0.1", port=8081)

        @app.get("/hello_world")
        def hello_world():
            resp ='{"hello":"world"}'
            return resp

        def start_server():
            app.run(server=self.server)

        self.thread = threading.Thread(target=start_server)
        self.thread.start()
        time.sleep(0.5)

    def tearDown(self):
        self.server.stop()

    def test_case_1(self):
        pass

if __name__ == '__main__':
    unittest.main()