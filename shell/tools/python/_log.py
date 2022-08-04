import logging
import os
import sys

try:
    from rich.logging import RichHandler
except ModuleNotFoundError:
    dir = os.path.dirname(os.path.realpath(__file__))
    print(
        "You probably haven't installed dependencies in the Python environment that "
        "you're trying to run these scripts from!"
    )
    print(
        f"Run `pip install -r {dir}/requirements.txt`, and then run that script again."
    )
    sys.exit(1)


logging.basicConfig(
    level="INFO",
    format="%(message)s",
    datefmt="[%X]",
    handlers=[RichHandler()],
)

logging.getLogger("sh").setLevel(logging.CRITICAL)  # Comment out to see sh's logs
