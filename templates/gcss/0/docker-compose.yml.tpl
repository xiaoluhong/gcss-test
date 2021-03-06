version: '2'
volumes:
  {{.Values.nfsvolume}}:
    external: true
    driver: ${driver}
  {{.Values.imagevolume}}:
    external: true
    driver: ${driver}
services:
  {{.Values.svc1}}:
    image: ${harborhost}/gcss/gcss-programme:1.0
    stdin_open: true
    volumes:
    - ${nfsvolume}:/gcss
    tty: true
    labels:
      io.rancher.container.pull_image: always
  gcss-contract:
    image: ${harborhost}/gcss/gcss-contract:1.0
    stdin_open: true
    tty: true
    volumes:
    - ${nfsvolume}:/gcss
    labels:
      io.rancher.container.pull_image: always
  nginx:
    image: ${harborhost}/gcss/gcss-nginx:1.0
    stdin_open: true
    tty: true
    labels:
      io.rancher.container.pull_image: always
  springboot-login:
    image: ${harborhost}/gcss/springboot-login:1.0
    stdin_open: true
    tty: true
    volumes:
    - ${nfsvolume}:/gcss
    labels:
      io.rancher.container.pull_image: always
  gcss-product:
    image: ${harborhost}/gcss/gcss-product:1.0
    stdin_open: true
    tty: true
    volumes:
    - ${nfsvolume}:/gcss
    - ${imagevolume}:/Image
    labels:
      io.rancher.container.pull_image: always
  gcss-login:
    image: ${harborhost}/gcss/gcss-login:1.0
    stdin_open: true
    tty: true
    volumes:
    - ${nfsvolume}:/gcss
    labels:
      io.rancher.container.pull_image: always
  gcss-wechatpay:
    image: ${harborhost}/gcss/gcss-wechatpay:1.0
    stdin_open: true
    tty: true
    volumes:
    - ${nfsvolume}:/gcss
    labels:
      io.rancher.container.pull_image: always
