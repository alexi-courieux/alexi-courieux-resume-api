import logging
from logging.handlers import TimedRotatingFileHandler
import os

# Configure the logger
# Ensure the logs directory exists
log_directory = "logs"
if not os.path.exists(log_directory):
    os.makedirs(log_directory)

# Configure the logger to create a new file every day
log_filename = os.path.join(log_directory, "resume_api.log")
handler = TimedRotatingFileHandler(log_filename, when="MIDNIGHT", interval=1)
handler.suffix = "%Y-%m-%d_%H-%M-%S"
handler.backupCount = 30
handler.setFormatter(logging.Formatter("%(asctime)s - %(name)s - %(levelname)s - %(message)s - %(pathname)s:%(lineno)d"))

logging.basicConfig(
    level=logging.INFO,
    handlers=[handler]
)

logger = logging.getLogger("resume_api")