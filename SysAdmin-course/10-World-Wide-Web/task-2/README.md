# Shell Prompt with Weather Information

## Summary
In this task, I customized the Bash shell prompt (`PS1`) to display the current temperature for my city using data from the `wttr.in` service.  
The temperature is fetched once when the shell starts and shown at the end of the prompt without impacting terminal performance.

---

## Goal
Learn how to extend the shell prompt with additional dynamic information using external web services and environment variables.

---

## Task Description
The `wttr.in` service provides weather information via HTTP and can be accessed using `curl`.

Example requests:
```bash
curl wttr.in/Omsk
curl "wttr.in/Omsk?format=%t"

#===============================================================================================

Implementation
Step 1. Fetch temperature

The temperature for Togliatti is requested once during shell initialization:

temp=$(curl -s "wttr.in/Togliatti?format=%t")


The -s flag is used to suppress unnecessary output from curl.

Step 2. Modify the shell prompt

The variable is appended to the end of the prompt definition:

PS1='\u@\h \w $ '"$temp"


This results in a prompt similar to:

user@host ~/projects $ +3°C

How It Works

The HTTP request is executed only when a new shell session starts

The prompt does not perform network requests on every command

The temperature is updated after restarting the shell or running:

source ~/.bashrc


This approach keeps the prompt responsive and avoids unnecessary network usage.

Result

The shell prompt successfully displays the current temperature for the selected city at the end of the prompt.

Conclusion

This task demonstrates:

Using curl to interact with web services

Command substitution in Bash

Safe and efficient customization of the shell prompt

The solution is simple, readable, and follows best practices for shell configuration.