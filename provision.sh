yum install -y redhat-lsb-core wget rpmdevtools rpm-build createrepo yum-utils dnf-utils gcc hicolor-icon-theme desktop-file-utils gcc-toolset-12-annobin-plugin-gcc gcc-toolset-12-binutils gcc-toolset-12-gcc-c++
cd /root
yumdownloader --source btop
rpm -i btop-1.2.13-3.el8.src.rpm
yum-builddep rpmbuild/SPECS/btop.spec
rpmbuild -bb rpmbuild/SPECS/btop.spec 
yum install -y nginx
systemctl start nginx && systemctl enable nginx
mkdir /usr/share/nginx/html/repo
cp rpmbuild/RPMS/x86_64/btop-1.2.13-3.el8.x86_64.rpm /usr/share/nginx/html/repo/
createrepo /usr/share/nginx/html/repo/
nginx -s reload
cat >> /etc/yum.repos.d/otus.repo << EOF
[otus]
name=otus-linux
baseurl=http://localhost/repo
gpgcheck=0
enabled=1
EOF
yum install -y btop.x86_64 --repo otus


