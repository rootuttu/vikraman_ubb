FROM ghcr.io/amirulandalib/whatisthis:latest

# set timezone
ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# clone the repo and change workdir
RUN git clone https://github.com/rootuttu/vikraman_ubb.git /root/vikraman_ubb/
WORKDIR /root/vikraman_ubb/

# install main requirements.
RUN pip3 install --no-cache-dir -r requirements.txt
RUN pip3 uninstall av -y && pip3 install av --no-binary av

# start the bot
CMD ["bash", "resources/startup/startup.sh"]
