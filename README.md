## Steps to reproduce

1. Build docker image with sshd agent
   ```bash
   bin/setup
   ```
2. Run docker container with this repository mounted
   ```bash
   bin/start
   ```
3. Open container in zed
   ```bash
   open zed://ssh/root@localhost:2222/app
   ```

   Password: `passwd`

4. Try auto-complete inside `src/input.css` and `src/input.html`
