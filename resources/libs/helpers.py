from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.firefox import GeckoDriverManager


def prepare_driver(browser):
    if browser == "chrome":
        ChromeDriverManager().install()
    elif browser == "firefox":
        GeckoDriverManager().install()
    else:
        raise Exception("Incorrect browser")