import os
from dotenv import load_dotenv
import yaml


def load_config(env="dev"):
    # Load .env file
    dotenv_path = f"config/{env}/.env"
    load_dotenv(dotenv_path)

    # Load YAML config
    with open(f"config/{env}/config.yaml", "r") as f:
        cfg = yaml.safe_load(f)

    # Replace placeholders with environment variables
    for key, value in cfg.get("database", {}).items():
        if isinstance(value, str) and value.startswith("${") and value.endswith("}"):
            var_name = value[2:-1]
            cfg["database"][key] = os.getenv(var_name)

    return cfg


# Example usage
config = load_config("dev")
print(config)
