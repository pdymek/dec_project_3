import os
import clickhouse_connect
from dotenv import load_dotenv
import pytest

load_dotenv()

@pytest.fixture
def setup_clickhouse_client():
    CLICKHOUSE_HOST = os.environ.get("CLICKHOUSE_HOST")
    CLICKHOUSE_PORT = os.environ.get("CLICKHOUSE_PORT")
    CLICKHOUSE_USERNAME = os.environ.get("CLICKHOUSE_USERNAME")
    CLICKHOUSE_PASSWORD = os.environ.get("CLICKHOUSE_PASSWORD")

    client = clickhouse_connect.get_client(
        host=CLICKHOUSE_HOST,
        port=int(CLICKHOUSE_PORT),
        username=CLICKHOUSE_USERNAME,
        password=CLICKHOUSE_PASSWORD,
    )
    return client

def test_connection(setup_clickhouse_client):
    clickhouse_client = setup_clickhouse_client
    assert clickhouse_client.server_version

def test_table_sensors_exists(setup_clickhouse_client):
    clickhouse_client = setup_clickhouse_client
    table_name = 'fleet_mgmt_sensors'
    result = clickhouse_client.command(f'CHECK TABLE {table_name};')
    assert result == 1

def test_table_location_exists(setup_clickhouse_client):
    clickhouse_client = setup_clickhouse_client
    table_name = 'fleet_mgmt_location'
    result = clickhouse_client.command(f'CHECK TABLE {table_name};')
    assert result == 1

def test_table_description_exists(setup_clickhouse_client):
    clickhouse_client = setup_clickhouse_client
    table_name = 'fleet_mgmt_description'
    result = clickhouse_client.command(f'CHECK TABLE {table_name};')
    assert result == 1