# FTPNuker
A simple tool for brute-forcing FTP using basic cURL commands. </br></br>
<img width="354" alt="image" src="https://user-images.githubusercontent.com/59119926/184116714-15494694-de0c-4061-b226-7ca1edc90754.png">


## Usage

Simply run `./FTPNuker.sh target_host user_name path_to_passlist.txt` </br>
The script sends simple cURL requests with the credentials, and scans the response for success login codes (`225, 226`).

### Internal Settings
You can modify the `cURL` timeout, target port and frequency of echoing inside the bash file.

## General Notes

* This script does not attempt [anonymous login](https://securityforeveryone.com/tools/anonymous-ftp-login-checker)
* This won't work on machines that implement protection against FTP bruteforcing


# Disclaimer

This tool is only for testing and can only be used where strict consent has been given. Do not use it for illegal purposes! It is the end user’s responsibility to obey all applicable local, state and federal laws. I assume no liability and am not responsible for any misuse or damage caused by this tool and software.

Distributed under the GNU License.
