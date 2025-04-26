apt update && apt upgrade -y
apt install -y python3 python3-pip python3-venv
apt install -y python3-venv python3-full
python3 -m venv venv
source venv/bin/activate

apt update && apt install -y python3-dev python3-pip python3-venv build-essential libffi-dev libssl-dev
pip install --upgrade pip setuptools wheel

apt install -y docker-compose

# pip install docker-compose
