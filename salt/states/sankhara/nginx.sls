nginx packages:
    pkg.installed:
        - pkgs:
            - nginx
            - php5-fpm
/etc/nginx/sites-enabled/default:
    file.absent
/etc/nginx/sites-enabled/sankhara:
    file.managed:
        - source: salt://sankhara/nginx-site
        - template: jinja
nginx running:
    service.running:
        - name: nginx
        - watch:
            - file: /etc/nginx/sites-enabled/sankhara
php running:
    service.running:
        - name: php5-fpm
