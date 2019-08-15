Ideas to implement:

- Set wifi credentials and pi user password
- install.sh shell script that:
    - Installs node and this system as a systemd service
    - Can be downloaded with wget like NodeSource PPA
    - Installs pigpio apt package (and any other apt packages needed)
- Things to do through web and CLI:
    - Upload project
    - Create systemd service for project (i.e. start on startup)
    - Get systemctl status and logs for systemd enabled project through web
    - Run project with --inspect-brk so it can be remotely debugged with VS Code et al.
    - Configure I2C and UART (and SPI)
