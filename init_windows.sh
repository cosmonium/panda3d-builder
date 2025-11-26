sudo apt install -y make zip
git clone http://github.com/cosmonium/panda3d.git --branch cosmonium build
curl https://www.panda3d.org/download/panda3d-1.10.15/panda3d-1.10.15-tools-win64.zip -o build/thirdparty-tools.zip
cd build
unzip thirdparty-tools.zip
mv panda3d-*/thirdparty .
rm thirdparty-tools.zip

PYTHON=thirdparty/win-python3.10-x64/python.exe

curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
$PYTHON get-pip.py
