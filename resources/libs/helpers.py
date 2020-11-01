from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.firefox import GeckoDriverManager
from webdriver_manager.microsoft import EdgeChromiumDriverManager


def get_driver_path(browser):
    driver_path = ""
    if browser == "chrome":
        driver_path = ChromeDriverManager().install()
    elif browser == "firefox":
        driver_path = GeckoDriverManager().install()
    elif browser == "edge":
        driver_path = EdgeChromiumDriverManager().install()
    else:
        print("Incorrect Browser")
    return driver_path
