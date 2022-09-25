void setupCoprocessor(char *applicationId, const char *serialDeviceName);

void sendProgramToCoprocessor(char* program, char *output);

void callFunctionOnCoprocessor(char* functionName, char* parameters, char* output);

void callFunctionOnCoprocessorAsync(char* functionName, char* parameters, char* output, void (*callback)());

void callVoidFunctionOnCoprocessorAsync(char* functionName, char* parameters);

void callEvalOnCoprocessor(char* toEval, char* output);

void wait(float whatever);

void coprocessorEventLoopActions();

char *strtokm(char *str, const char *delim);

OSErr closeSerialPort();

Boolean asyncCallActive;