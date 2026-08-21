from webdriver_manager.chrome import ChromeDriverManager
from webdriver_manager.firefox import GeckoDriverManager
from selenium.webdriver.chrome.options import Options as ChromeOptions
from selenium.webdriver.firefox.options import Options as FirefoxOptions
from selenium.webdriver.common.by import By
from robot.libraries.BuiltIn import BuiltIn


def prepare_driver(browser):
    if browser == "chrome":
        ChromeDriverManager().install()
    elif browser == "firefox":
        GeckoDriverManager().install()
    else:
        raise Exception("Incorrect browser")


def get_chrome_options():
    return ChromeOptions()


def get_firefox_options():
    return FirefoxOptions()


def _get_driver():
    return BuiltIn().get_library_instance("SeleniumLibrary").driver


def _selectors_list(selectors):
    parsed = []
    for raw in selectors.split("||"):
        selector = raw.strip()
        if not selector:
            continue
        if selector.startswith("css:"):
            selector = selector[4:]
        parsed.append(selector)
    return parsed


def input_text_in_first_visible(selectors, text):
    driver = _get_driver()
    for selector in _selectors_list(selectors):
        elements = driver.find_elements(By.CSS_SELECTOR, selector)
        for element in elements:
            if element.is_displayed() and element.is_enabled():
                element.clear()
                element.send_keys(text)
                return selector
    raise AssertionError(f"No visible+enabled input found for selectors: {selectors}")


def click_first_visible(selectors):
    driver = _get_driver()
    for selector in _selectors_list(selectors):
        elements = driver.find_elements(By.CSS_SELECTOR, selector)
        for element in elements:
            if element.is_displayed() and element.is_enabled():
                element.click()
                return selector
    raise AssertionError(f"No visible+enabled clickable element found for selectors: {selectors}")


def press_enter_in_first_visible(selectors):
    driver = _get_driver()
    for selector in _selectors_list(selectors):
        elements = driver.find_elements(By.CSS_SELECTOR, selector)
        for element in elements:
            if element.is_displayed() and element.is_enabled():
                element.send_keys("\n")
                return selector
    raise AssertionError(f"No visible+enabled input found for selectors: {selectors}")