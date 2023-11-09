# 镜像来源
FROM aidenlu/oo-unlimit:7.5.1.1

# 移除一些插件
RUN rm -rf /var/www/onlyoffice/documentserver/sdkjs-plugins/youtube
RUN rm -rf /var/www/onlyoffice/documentserver/sdkjs-plugins/translator
RUN rm -rf /var/www/onlyoffice/documentserver/sdkjs-plugins/zotero
RUN rm -rf /var/www/onlyoffice/documentserver/sdkjs-plugins/mendeley
RUN rm -rf /var/www/onlyoffice/documentserver/sdkjs-plugins/thesaurus
RUN rm -rf /var/www/onlyoffice/documentserver/sdkjs-plugins/ocr

# 移除字体
RUN rm -rf /usr/share/fonts/truetype/dejavu
RUN rm -rf /usr/share/fonts/truetype/liberation

# 导入中文字体
ADD ["onlyoffice-chinese-fonts/fonts for oo6/*", "/usr/share/fonts/truetype/custom/"] 

# 添加一些插件
ADD onlyoffice-plugins/sdkjs-plugins/content/html /var/www/onlyoffice/documentserver/sdkjs-plugins/html
ADD onlyoffice-plugins/sdkjs-plugins/content/autocomplete /var/www/onlyoffice/documentserver/sdkjs-plugins/autocomplete
ADD ponlyoffice-plugins/sdkjs-plugins/content/doc2md /var/www/onlyoffice/documentserver/sdkjs-plugins/doc2md
ADD onlyoffice-plugins/sdkjs-plugins/content/wordscounter /var/www/onlyoffice/documentserver/sdkjs-plugins/wordscounter

# 修正hightlight js引用问题
RUN sed -i "s/https:\/\/ajax.googleapis.com\/ajax\/libs\/jquery\/2.2.2\/jquery.min.js/vendor\/jQuery-2.2.2-min\/jquery-v2.2.2-min.js/" /var/www/onlyoffice/documentserver/sdkjs-plugins/highlightcode/index.html

# 修改文件缓存时间
# 修改24小时为1小时
# RUN sed -i  "s/86400/3600/" /etc/onlyoffice/documentserver/default.json

EXPOSE 80 443

ARG COMPANY_NAME=onlyoffice
VOLUME /var/log/$COMPANY_NAME /var/lib/$COMPANY_NAME /var/www/$COMPANY_NAME/Data /var/lib/postgresql /var/lib/rabbitmq /var/lib/redis /usr/share/fonts/truetype/custom

ENTRYPOINT ["/app/ds/run-document-server.sh"]
