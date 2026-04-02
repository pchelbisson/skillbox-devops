import pytest

def test_os_release(host):
    assert host.system_info.distribution.lower() == "alpine"

def test_nginx_binary_exists(host):
    assert host.file("/usr/sbin/nginx").exists or host.file("/usr/local/bin/nginx").exists

def test_nginx_version(host):
    cmd = host.run("nginx -v")
    assert cmd.rc == 0
    assert "nginx" in cmd.stderr.lower() or "nginx" in cmd.stdout.lower()