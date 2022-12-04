# Домашнее задание: Systemd

Выполнить следующие задания и подготовить развёртывание результата выполнения с использованием Vagrant и Vagrant shell provisioner (или Ansible, на Ваше усмотрение):

1. Написать service, который будет раз в 30 секунд мониторить лог на предмет наличия ключевого слова (файл лога и ключевое слово должны задаваться в /etc/sysconfig).
2. Из репозитория epel установить spawn-fcgi и переписать init-скрипт на unit-файл (имя service должно называться так же: spawn-fcgi).
3. Дополнить unit-файл httpd (он же apache) возможностью запустить несколько инстансов сервера с разными конфигурационными файлами.

# Выполнение

Запускаем `Vagrantfile` и проверяем правильность выполнения заданий.

## 1. Написать service, который будет раз в 30 секунд мониторить лог на предмет наличия ключевого слова (файл лога и ключевое слово должны задаваться в /etc/sysconfig).



## 2. Из репозитория epel установить spawn-fcgi и переписать init-скрипт на unit-файл (имя service должно называться так же: spawn-fcgi).

```bash
[root@systemd ~]# systemctl status spawn-fcgi
● spawn-fcgi.service - Spawn-fcgi startup service by Otus
   Loaded: loaded (/etc/systemd/system/spawn-fcgi.service; enabled; vendor preset: disabled)
   Active: active (running) since Sun 2022-12-04 21:08:38 UTC; 17min ago
 Main PID: 3866 (php-cgi)
   CGroup: /system.slice/spawn-fcgi.service
           ├─3866 /usr/bin/php-cgi
           ├─3875 /usr/bin/php-cgi
           ├─3876 /usr/bin/php-cgi
           ├─3877 /usr/bin/php-cgi
...
```

## 3. Дополнить unit-файл httpd (он же apache) возможностью запустить несколько инстансов сервера с разными конфигурационными файлами.

```bash
[root@systemd ~]# ss -tnulp | grep httpd
tcp    LISTEN     0      128    [::]:8080               [::]:*                   users:(("httpd",pid=4082,fd=4),("httpd",pid=4081,fd=4),("httpd",pid=4080,fd=4),("httpd",pid=4079,fd=4),("httpd",pid=4078,fd=4),("httpd",pid=4077,fd=4),("httpd",pid=4075,fd=4))
tcp    LISTEN     0      128    [::]:80                 [::]:*                   users:(("httpd",pid=4062,fd=4),("httpd",pid=4061,fd=4),("httpd",pid=4060,fd=4),("httpd",pid=4059,fd=4),("httpd",pid=4058,fd=4),("httpd",pid=4056,fd=4),("httpd",pid=4054,fd=4))

```

