# ONLYOFFICE 中文包 授权（你懂的）镜像构建脚本

[![Docker Image CI](https://github.com/anyidea/oo-chinese-license/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/anyidea/oo-chinese-license/actions/workflows/docker-publish.yml)
[![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/aidenlu/oo-chinese-unlimit)](https://hub.docker.com/r/aidenlu/oo-chinese-unlimit)
[![Docker Pulls](https://img.shields.io/docker/pulls/aidenlu/oo-chinese-unlimit)](https://hub.docker.com/r/aidenlu/oo-chinese-unlimit)

* 基础镜像来源于[`anyidea/oo-ce-docker-license`](https://hub.docker.com/r/aidenlu/oo-unlimit)
* 引用了 `https://github.com/funggtopp/onlyoffice-chinese-fonts.git` 工程，解决中文字库问题
* 添加了 `wordscounter`,`doc2md`,`autocomplete`,`highlightcode`, `html` 插件
* 去除了 `youtube`,`translator`,`zotero`,`mendeley`,`thesaurus`,`ocr` 国内无法使用的插件
* 解决了 `hightligh`插件 引用google的jquery.min.js问题
