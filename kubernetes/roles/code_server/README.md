# Code Server Role

This role deploys code-server to an existing Kubernetes cluster. It will:

1. Create a dedicated namespace for code-server
2. Add the code-server Helm repository
3. Deploy code-server using Helm with the following configuration:
   - Service type: NodePort
   - Port: 8443
   - Persistent storage: 10Gi

## Requirements

- A running Kubernetes cluster
- Helm installed on the target machine
- Internet connection

## Dependencies

- kubernetes.core Ansible collection

## Access

After deployment, code-server will be accessible at:
```
https://localhost:8443
```

Note: The first time you access it, you'll need to accept the self-signed certificate warning in your browser. 


`http://192.168.0.168:30497`

`code-server --help`
```
$ code-server --help
code-server 4.100.0 d0e20d514d247470f110d48573d15604b141b81b with Code 1.100.0

Usage: code-server [options] [path]
    - Opening a directory: code-server ./path/to/your/project
    - Opening a saved workspace: code-server ./path/to/your/project.code-workspace

Options
      --auth                             The type of authentication to use. [password, none]
      --password                         The password for password authentication (can only be passed in via $PASSWORD or the config file).
      --hashed-password                  The password hashed with argon2 for password authentication (can only be passed in via $HASHED_PASSWORD or the config file).
                                         Takes precedence over 'password'.
      --cert                             Path to certificate. A self signed certificate is generated if none is provided.
      --cert-host                        Hostname to use when generating a self signed certificate.
      --cert-key                         Path to certificate key when using non-generated cert.
      --disable-telemetry                Disable telemetry.
      --disable-update-check             Disable update check. Without this flag, code-server checks every 6 hours against the latest github release and
                                         then notifies you once every week that a new release is available.
      --disable-file-downloads           Disable file downloads from Code. This can also be set with CS_DISABLE_FILE_DOWNLOADS set to 'true' or '1'.
      --disable-file-uploads             Disable file uploads.
      --disable-workspace-trust          Disable Workspace Trust feature. This switch only affects the current session.
      --disable-getting-started-override Disable the coder/coder override in the Help: Getting Started page.
      --disable-proxy                    Disable domain and path proxy routes.
   -h --help                             Show this output.
      --link-protection-trusted-domains  Links matching a trusted domain can be opened without link protection.
      --locale                           Set vscode display language and language to show on the login page, more info see
                                         https://en.wikipedia.org/wiki/IETF_language_tag
      --open                             Open in browser on startup. Does not work remotely.
      --bind-addr                        Address to bind to in host:port. You can also use $PORT to override the port.
      --config                           Path to yaml config file. Every flag maps directly to a key in the config file.
      --socket                           Path to a socket (bind-addr will be ignored).
      --socket-mode                      File mode of the socket.
      --trusted-origins                  Disables authenticate origin check for trusted origin. Useful if not able to access reverse proxy configuration.
   -v --version                          Display version information.
      --user-data-dir                    Path to the user data directory.
      --extensions-dir                   Path to the extensions directory.
      --list-extensions                  List installed VS Code extensions.
      --force                            Avoid prompts when installing VS Code extensions.
      --install-extension                Install or update a VS Code extension by id or vsix. The identifier of an extension is `${publisher}.${name}`.
                                         To install a specific version provide `@${version}`. For example: 'vscode.csharp@1.2.3'.
      --enable-proposed-api              Enable proposed API features for extensions. Can receive one or more extension IDs to enable individually.
      --uninstall-extension              Uninstall a VS Code extension by id.
      --show-versions                    Show VS Code extension versions.
      --github-auth                      GitHub authentication token (can only be passed in via $GITHUB_TOKEN or the config file).
      --proxy-domain                     Domain used for proxying ports.
      --skip-auth-preflight              Allows preflight requests through proxy without authentication.
   -e --ignore-last-opened               Ignore the last opened directory or workspace in favor of an empty window.
   -n --new-window                       Force to open a new window.
   -r --reuse-window                     Force to open a file or folder in an already opened window.
 -vvv --verbose                          Enable verbose logging.
  -an --app-name                         The name to use in branding. Will be shown in titlebar and welcome message
   -w --welcome-text                     Text to show on login page
      --abs-proxy-base-path              The base path to prefix to all absproxy requests
```