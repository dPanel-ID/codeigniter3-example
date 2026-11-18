## CodeIgniter 3 Example

A plain CodeIgniter 3.1.13 application, ready to deploy with dPanel on current PHP (8.4 and 8.5) through FrankenPHP, without Docker and without SSH.

CodeIgniter 3 is the legacy line of the framework: CodeIgniter 4 is the current version, and CodeIgniter 3 is in maintenance. Many applications still run on it, though. This repository shows how to keep one running on a modern server while you plan the move.

### What is in it

| Path | What it does |
| --- | --- |
| `application/` | The app: `Welcome` (home page), `Blog` and `Health` (`GET /health`, JSON, for monitors) controllers and their views. |
| `system/` | CodeIgniter 3.1.13, with two small patches for current PHP (see below). |
| `scripts/build.sh` | The **build step**. Creates `application/cache/sessions` and `application/logs`, and writes a FrankenPHP configuration that serves the app on `$PORT` and refuses requests for `application/`, `system/`, `scripts/`, dotfiles and `.sh`, `.sql`, `.log` files. |
| `scripts/start.sh` | The **runtime command**. Starts FrankenPHP with that configuration. |
| `scripts/start-dev.sh` | Runs the app on your own computer with PHP's built-in server on port 8081. |

### Deploy with dPanel

1. Fork this repository so your GitHub connection can see it.
2. On your server, install the **PHP** and **FrankenPHP** modules. No database is needed.
3. Create an application from your fork, select PHP and FrankenPHP, and keep the default commands: build `./scripts/build.sh`, runtime `./scripts/start.sh`, and the port dPanel suggests.
4. Add one runtime variable, the public address with a trailing slash:

   ```text
   CI_BASE_URL=https://ci3.example.com/
   ```

   Optional: `CI_ENV` (`production` by default; `development` shows every PHP error).
5. Deploy, then put a load balancer with HTTPS in front of the application.

### Run it on your computer

```bash
./scripts/start-dev.sh
```

Then open http://localhost:8081. It needs only PHP on your `PATH` and runs with `CI_ENV=development`.

### Changes from stock CodeIgniter 3.1.13

- `system/`: `#[\AllowDynamicProperties]` on the classes CodeIgniter assigns properties to at runtime (`CI_Controller`, `CI_Loader`, `CI_Router`, `CI_URI`, `CI_Model`, `CI_DB_driver`, `CI_Driver_Library`, `CI_Driver`), so PHP 8.2+ raises no deprecation on every request; and the `E_STRICT` constant, deprecated in PHP 8.4, replaced by its old value `2048`. The attribute is a comment on PHP 7, so older PHP still works.
- `index.php`: `CI_ENV` is read from the environment as well as `$_SERVER`, and defaults to `production`.
- `application/config/config.php`: `base_url` comes from `CI_BASE_URL`, `index_page` is empty (FrankenPHP routes every unknown path to `index.php`), and file sessions are stored in `application/cache/sessions`.
