# T-Calc 🧮

A minimal, terminal-based calculator written in Kotlin. Built as a hands-on Kotlin learning project — featuring a clean REPL loop, regex-based input validation, and a square root mode.

```
+-----------------------------------+
| _____            ____      _      |
||_   _|          / ___|__ _| | ___ |
|  | |    _____  | |   / _` | |/ __||
|  | |   |_____| | |__| (_| | | (__ |
|  |_|            \____\__,_|_|\___||
+-----------------------------------+
```

## Features

-  **Basic arithmetic** — addition, subtraction, multiplication, division, modulo
-  **Smart number formatting** — whole results (e.g. `4.0`) display as `4`, decimals stay as decimals
-  **Square root mode** — type `sqrt` and enter a number
-  **Continuous REPL loop** — keeps running until you type `exit`
-  **Regex-based validation** — rejects junk input gracefully
-  **Built-in help** — type `help` to see commands and operators
-  **Auto-clear screen** between modes (ANSI escape codes)

## Usage

Once running, the prompt accepts any of these:

```
[number] [operator] [number]   →  performs the math      (e.g. 5 + 3)
sqrt                            →  enters square-root mode
help                            →  shows the help text
exit                            →  quits the calculator
```

### Supported operators

| Symbol | Operation |
|--------|-----------|
| `+`    | Addition |
| `-`    | Subtraction |
| `*`    | Multiplication |
| `/`    | Division |
| `%`    | Remainder (modulo) |

### Examples

```
> 5 + 3
8

> 10 / 4
2.5

> sqrt
Input the number to calculate the square root:
> 16
4

> help
(prints the help screen)

> exit
```

## Tech Stack

- 🟣 **Kotlin** — language
- 🛠️ **kotlinc** — compiler
- ☕ **JVM** — runtime
- 🧵 **Bash scripts** — install / uninstall helpers

## Dependencies

To build and run T-Calc, you need:

- **Kotlin** 1.6+ (`kotlinc`)
- **Java** 11+ (JDK or JRE) — required to run `.jar` files

### Installing prerequisites

#### Arch Linux
```bash
sudo pacman -S kotlin jdk-openjdk
```

#### Debian / Ubuntu
```bash
sudo apt install kotlin default-jdk
```

#### macOS
```bash
brew install kotlin openjdk
```

#### Any platform — via SDKMAN
```bash
curl -s "https://get.sdkman.io" | bash
sdk install kotlin
sdk install java
```

## Installation

### Option 1 — Using the install script (recommended)

```bash
git clone https://github.com/Lamboorg/t-calc.git
cd t-calc
chmod +x install.sh
./install.sh
```

### Option 2 — Manual build

```bash
git clone https://github.com/Lamboorg/t-calc.git
cd t-calc
kotlinc src/main.kt -include-runtime -d t-calc.jar
java -jar t-calc.jar
```

## Uninstall

```bash
chmod +x uninstall.sh
./uninstall.sh
```

## Project structure

```
t-calc/
├── install.sh          # build + install script
├── uninstall.sh        # cleanup script
├── README.md
└── src/
    └── main.kt         # the entire calculator
```

## Future ideas

- Power operator (`^`) for exponents
- Multi-step expressions (e.g. `2 + 3 * 4` with proper precedence)
- History recall (last result stored as `ans`)
- Negative number support (currently regex catches this, but parser doesn't handle a leading `-`)
- More math functions (`sin`, `cos`, `log`)

## License

MIT — feel free to fork, modify, or submit PRs.

---

👤 Built by [Lamboorg](https://github.com/Lamboorg) as part of an own project and learning Kotlin (wanted my own calculator).
