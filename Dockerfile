FROM ubuntu:24.10
RUN apt-get -y update && apt-get install -y openssh-client
RUN mkdir -p /home/pragra/.ssh 
RUN mkdir -p /home/pragra/folder1 && echo "This is file1.txt" >> /home/pragra/folder1/file1.txt 
RUN mkdir -p /home/pragra/folder2 && echo "This is file2.txt" >> /home/pragra/folder2/file2.txt
RUN groupadd -g 1001 pragra 
RUN useradd -m -u 1001 -g 1001 -p pragra pragra   
RUN ssh-keygen -t rsa -f /home/pragra/.ssh/builder_id_rsa 
RUN chown -R pragra:pragra /home/pragra/.ssh
RUN chmod 770 -R /home/pragra/folder1 && chmod 770 -R /home/pragra/folder2 
RUN chown -R pragra:pragra /home/pragra/folder1/file1.txt
RUN chown -R pragra:pragra /home/pragra/folder2/file2.txt 
COPY . /home/pragra
WORKDIR /home/pragra