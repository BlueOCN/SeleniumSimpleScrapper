from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
import time


def main():
    # Set up Chrome options
    options = Options()
    options.add_argument("--no-sandbox")
    options.binary_location = "C:/Users/Roberto/Desktop/Selenium/venv/bin/chrome-win64/chrome.exe"
    # Replace with the path to your local Chrome binary

    # Set up ChromeDriver service
    service = Service(executable_path="C:/Users/Roberto/Desktop/Selenium/venv/drivers/chromedriver.exe")  # Forward slashes
    # Replace with the path to your ChromeDriver


    # Initialize the WebDriver
    driver = webdriver.Chrome(service=service, options=options)

    try:
        driver.get("https://google.com")
        input_element = driver.find_element(By.CLASS_NAME, "gLFyf")  # Replace 'classname' with the actual class name
        input_element.send_keys("tech with tim" + Keys.ENTER)

    except Exception as e:
        print("An error occurred:", e)

    finally:
        time.sleep(10)
        driver.quit()

if __name__ == "__main__":
    main()

