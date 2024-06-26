module FDD

using ..Wrapper: R11_SDK_DLL
using ..TypeAlias
using ..FDDstruct
using ..FDDerror
using Libdl: dlsym

# ----------------------------------------------------------------------
#    CommLib API
# ----------------------------------------------------------------------

function LibGetVersion(version)
    F = dlsym(R11_SDK_DLL[], :FDD_LibGetVersion)
    @rccheck ccall(F, FDD_RESULT, (Ptr{Cchar},), version)
end

function ExcGetMsg(msg)
    F = dlsym(R11_SDK_DLL[], :FDD_ExcGetMsg)
    @rccheck ccall(F, FDD_RESULT, (Ptr{Ptr{Cchar}},), msg)
end

function DevEnumerateComPorts(devList, devCount)
    F = dlsym(R11_SDK_DLL[], :FDD_DevEnumerateComPorts)
    @rccheck ccall(F, FDD_RESULT, (Ptr{Ptr{Dev}}, Ptr{UInt16}), devList, devCount)
end

function DevEnumerateHID(vid, pid, devList, devCount)
    F = dlsym(R11_SDK_DLL[], :FDD_DevEnumerateHID)
    @rccheck ccall(F, FDD_RESULT, (UInt16, UInt16, Ptr{Ptr{Dev}}, Ptr{UInt16}), vid, pid, devList, devCount)
end

function DevEnumerateWinUSB(guid, devList, devCount)
    F = dlsym(R11_SDK_DLL[], :FDD_DevEnumerateWinUSB)
    @rccheck ccall(F, FDD_RESULT, (Cstring, Ptr{Ptr{Dev}}, Ptr{UInt16}), guid, devList, devCount)
end

function DevGetFirst(pDevId)
    F = dlsym(R11_SDK_DLL[], :FDD_DevGetFirst)
    @rccheck ccall(F, FDD_RESULT, (Ptr{Ptr{Cchar}},), pDevId)
end

function DevGetNext(pDevId)
    F = dlsym(R11_SDK_DLL[], :FDD_DevGetNext)
    @rccheck ccall(F, FDD_RESULT, (Ptr{Ptr{Cchar}},), pDevId)
end

function DevOpenComPort(portName, timeout, baudRate, doResync)
    F = dlsym(R11_SDK_DLL[], :FDD_DevOpenComPort)
    @rccheck ccall(F, FDD_RESULT, (Ptr{Cchar}, UInt16, UInt32, BOOL), portName, timeout, baudRate, doResync)
end

function DevOpenHID(devPath, timeout)
    F = dlsym(R11_SDK_DLL[], :FDD_DevOpenHID)
    @rccheck ccall(F, FDD_RESULT, (Ptr{Cchar}, UInt16), devPath, timeout)
end

function DevOpenWinUSB(devPath, timeout)
    F = dlsym(R11_SDK_DLL[], :FDD_DevOpenWinUSB)
    @rccheck ccall(F, FDD_RESULT, (Cstring, UInt16), devPath, timeout)
end

function DevSetTimeout(timeout)
    F = dlsym(R11_SDK_DLL[], :FDD_DevSetTimeout)
    @rccheck ccall(F, FDD_RESULT, (UInt16,), timeout)
end

function DevGetTimeout(timeout)
    F = dlsym(R11_SDK_DLL[], :FDD_DevGetTimeout)
    @rccheck ccall(F, FDD_RESULT, (UInt16,), timeout)
end

function DevClose()
    F = dlsym(R11_SDK_DLL[], :FDD_DevClose)
    @rccheck ccall(F, FDD_RESULT, (), )
end

function FlashRead(buf, offset, len)
    F = dlsym(R11_SDK_DLL[], :FDD_FlashRead)
    @rccheck ccall(F, FDD_RESULT, (Ptr{Cvoid}, UInt16, UInt16), buf, offset, len)
end

function FlashWrite(buf, offset, len)
    F = dlsym(R11_SDK_DLL[], :FDD_FlashWrite)
    @rccheck ccall(F, FDD_RESULT, (Ptr{Cvoid}, UInt16, UInt16), buf, offset, len)
end

end # module FDD