# MIT License

# Copyright (c) Bryan Hughes <bryan@nebri.us>

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

install_dir=/usr/local

# Install Node.js, git, and pigpio
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - || { exit 1; }
sudo apt-get install -y nodejs git pigpio || { exit 1; }

# Download this app
sudo git clone https://github.com/nebrius/raspi-io-config.git $install_dir || { exit 1; }
cd $install_dir/raspi-io-config/server || { exit 1; }
sudo npm install || { exit 1; }

# Create the system service
cd $install_dir/raspi-io-config/scripts || { exit 1; }
sudo cp raspi-io-config.service /etc/systemd/system/ || { exit 1; }

# Activate the service
sudo systemctl enable systemd-networkd-wait-online.service || { exit 1; }
sudo systemctl enable raspi-io-config || { exit 1; }
