Dockerfile and related SystemD unit file for running [rtl_433](https://github.com/merbanan/rtl_433) inside Docker on a Raspberry Pi (or other arm32v7 system). By default the SystemD unit file is set up to send output over MQTT. Useful for easily getting the output of 433MHz temperature sensors into [Home Assistant](https://www.home-assistant.io/).

# SystemD installation

Just copy `rtl_433.service` to `/etc/systemd/system/rtl_433.service` on your Pi. Modify `HOST`, `USER`, `PORT`, and `PASS` to match your setup. You'll probably also want to modify the `-R 20` line for whatever sensors you want to read. `johnboiles/rtl_433` should be pulled from Docker Hub automatically.
