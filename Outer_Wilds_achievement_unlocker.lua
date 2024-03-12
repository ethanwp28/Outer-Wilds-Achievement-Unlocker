<?xml version="1.0" encoding="utf-8"?>
<CheatTable CheatEngineTableVersion="45">
  <CheatEntries>
    <CheatEntry>
      <ID>5</ID>
      <Description>"Enable Achievement Unlocker"</Description>
      <Options moHideChildren="1" moDeactivateChildrenAsWell="1"/>
      <Color>008000</Color>
      <VariableType>Auto Assembler Script</VariableType>
      <AssemblerScript>{ Game   : Outer Wilds.exe
  Version: 1.12.181.0 | Windows Store
  Date   : 2024-03-12
  Author : SvT (Echoes of the Eye achievements added by Ethan)
}

[ENABLE]
LuaCall(function cycleFullCompact(sender,force) local state = not(compactmenuitem.Caption == 'Compact View Mode'); if force~=nil then state = not force end; compactmenuitem.Caption = state and 'Compact View Mode' or 'Full View Mode'; getMainForm().Splitter1.Visible = state; getMainForm().Panel4.Visible    = state; getMainForm().Panel5.Visible    = state; end; function addCompactMenu() if compactmenualreadyexists then return end; local parent = getMainForm().Menu.Items; compactmenuitem = createMenuItem(parent); parent.add(compactmenuitem); compactmenuitem.Caption = 'Compact View Mode'; compactmenuitem.OnClick = cycleFullCompact; compactmenualreadyexists = 'yes'; end; addCompactMenu(); cycleFullCompact(nil,true))

{$lua}
LaunchMonoDataCollector()

  if (syntaxcheck) then return end
  local cls = GetLuaEngine()
           cls.mOutput.Lines.Clear()

     local domain = mono_enumDomains()[1]
     local klass = mono_findClass('', 'Achievement_TakeMeAlive')
     local instance = mono_class_findInstancesOfClassListOnly(domain,klass)

        for k,v in pairs(instance) do

        local BaseAddress = getAddressSafe(v)

        local _jumped_offset = 0x38
        local _jumped_address = getAddress(BaseAddress + _jumped_offset)
        local _jumped_value = readInteger(_jumped_address)

        local _timeOfJump_offset = 0x3C
        local _timeOfJump_address = getAddress(BaseAddress + _timeOfJump_offset)
        local _timeOfJump_value = readInteger(_timeOfJump_address)

        local addressList = getAddressList()
        local debugBox = addressList.getMemoryRecordByDescription('DEBUG (enable this first)')

        if (_jumped_value == 0 and _timeOfJump_value == 0x7F800000) then
           registerSymbol("instanceAddress",instance[k])
           if debugBox.Active == true then
              output1 = '[ %s ] --&gt; Instance ( %X ) --&gt; _jumped_address [ %X ] --&gt; _jumped_value hex: ( %08X ) &lt;-- int: ( %s )'
              output2 = '[ %s ] --&gt; Instance ( %X ) --&gt; _timeOfJump_address [ %X ] --&gt; _timeOfJump_value hex: ( %08X ) &lt;-- int: ( %s )'
              print((output1):format(k,instance[k],_jumped_address,_jumped_value or 0,_jumped_value))
              print((output2):format(k,instance[k],_timeOfJump_address,_timeOfJump_value or 0,_timeOfJump_value))
              print("TRUE : conditions met \n")
           end
        else
            if debugBox.Active == true then
              --print("FALSE : conditions not met \n")
            end
        end
     end

{$asm}

[DISABLE]
LuaCall(cycleFullCompact(nil,false))

unregistersymbol(instanceAddress)
</AssemblerScript>
      <CheatEntries>
        <CheatEntry>
          <ID>126</ID>
          <Description>"instanceAddress"</Description>
          <ShowAsHex>1</ShowAsHex>
          <ShowAsSigned>0</ShowAsSigned>
          <Color>0000FA</Color>
          <VariableType>Array of byte</VariableType>
          <ByteLength>0</ByteLength>
          <Address>instanceAddress</Address>
        </CheatEntry>
        <CheatEntry>
          <ID>127</ID>
          <Description>"Achievements"</Description>
          <Color>008000</Color>
          <GroupHeader>1</GroupHeader>
          <CheatEntries>
            <CheatEntry>
              <ID>158</ID>
              <Description>"Archaeologist"</Description>
              <VariableType>Auto Assembler Script</VariableType>
              <AssemblerScript>[ENABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 10 // replace achievement ID

{$lua}
if (syntaxcheck) then return end
local thread = createThread(function(timer) -- defer execution of lua code. important!
   do
     sleep(250)
     if (syntaxcheck) then return end
     mono_invoke_method(nil, mono_findMethod('','Achievement_TakeMeAlive', 'EarnAchievement'), getAddress('instanceAddress'), {})
   end
 end)

{$asm}
[DISABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0C // re-write and restore original achievement ID with  'Gone In 60 Seconds'
</AssemblerScript>
            </CheatEntry>
            <CheatEntry>
              <ID>170</ID>
              <Description>"Beginner's Luck"</Description>
              <VariableType>Auto Assembler Script</VariableType>
              <AssemblerScript>[ENABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 04 // replace achievement ID

{$lua}
if (syntaxcheck) then return end
local thread = createThread(function(timer) -- defer execution of lua code. important!
   do
     sleep(250)
     if (syntaxcheck) then return end
     mono_invoke_method(nil, mono_findMethod('','Achievement_TakeMeAlive', 'EarnAchievement'), getAddress('instanceAddress'), {})
   end
 end)

{$asm}
[DISABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0C // re-write and restore original achievement ID with  'Gone In 60 Seconds'
</AssemblerScript>
            </CheatEntry>
            <CheatEntry>
              <ID>160</ID>
              <Description>"Cutting it Close"</Description>
              <VariableType>Auto Assembler Script</VariableType>
              <AssemblerScript>[ENABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0E // replace achievement ID

{$lua}
if (syntaxcheck) then return end
local thread = createThread(function(timer) -- defer execution of lua code. important!
   do
     sleep(250)
     if (syntaxcheck) then return end
     mono_invoke_method(nil, mono_findMethod('','Achievement_TakeMeAlive', 'EarnAchievement'), getAddress('instanceAddress'), {})
   end
 end)

{$asm}
[DISABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0C // re-write and restore original achievement ID with  'Gone In 60 Seconds'
</AssemblerScript>
            </CheatEntry>
            <CheatEntry>
              <ID>167</ID>
              <Description>"Deep Impact"</Description>
              <VariableType>Auto Assembler Script</VariableType>
              <AssemblerScript>[ENABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 07 // replace achievement ID

{$lua}
if (syntaxcheck) then return end
local thread = createThread(function(timer) -- defer execution of lua code. important!
   do
     sleep(250)
     if (syntaxcheck) then return end
     mono_invoke_method(nil, mono_findMethod('','Achievement_TakeMeAlive', 'EarnAchievement'), getAddress('instanceAddress'), {})
   end
 end)

{$asm}
[DISABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0C // re-write and restore original achievement ID with  'Gone In 60 Seconds'
</AssemblerScript>
            </CheatEntry>
            <CheatEntry>
              <ID>164</ID>
              <Description>"Die Hard"</Description>
              <VariableType>Auto Assembler Script</VariableType>
              <AssemblerScript>[ENABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0A // replace achievement ID

{$lua}
if (syntaxcheck) then return end
local thread = createThread(function(timer) -- defer execution of lua code. important!
   do
     sleep(250)
     if (syntaxcheck) then return end
     mono_invoke_method(nil, mono_findMethod('','Achievement_TakeMeAlive', 'EarnAchievement'), getAddress('instanceAddress'), {})
   end
 end)

{$asm}
[DISABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0C // re-write and restore original achievement ID with  'Gone In 60 Seconds'
</AssemblerScript>
            </CheatEntry>
            <CheatEntry>
              <ID>168</ID>
              <Description>"From the Hearth to the Moon"</Description>
              <VariableType>Auto Assembler Script</VariableType>
              <AssemblerScript>[ENABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 06 // replace achievement ID

{$lua}
if (syntaxcheck) then return end
local thread = createThread(function(timer) -- defer execution of lua code. important!
   do
     sleep(250)
     if (syntaxcheck) then return end
     mono_invoke_method(nil, mono_findMethod('','Achievement_TakeMeAlive', 'EarnAchievement'), getAddress('instanceAddress'), {})
   end
 end)

{$asm}
[DISABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0C // re-write and restore original achievement ID with  'Gone In 60 Seconds'
</AssemblerScript>
            </CheatEntry>
            <CheatEntry>
              <ID>162</ID>
              <Description>"Gone In 60 Seconds"</Description>
              <VariableType>Auto Assembler Script</VariableType>
              <AssemblerScript>[ENABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0C // replace achievement ID

{$lua}
if (syntaxcheck) then return end
local thread = createThread(function(timer) -- defer execution of lua code. important!
   do
     sleep(250)
     if (syntaxcheck) then return end
     mono_invoke_method(nil, mono_findMethod('','Achievement_TakeMeAlive', 'EarnAchievement'), getAddress('instanceAddress'), {})
   end
 end)

{$asm}
[DISABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0C // re-write and restore original achievement ID with  'Gone In 60 Seconds'
</AssemblerScript>
            </CheatEntry>
            <CheatEntry>
              <ID>166</ID>
              <Description>"Harmonic Convergence"</Description>
              <VariableType>Auto Assembler Script</VariableType>
              <AssemblerScript>[ENABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 08 // replace achievement ID

{$lua}
if (syntaxcheck) then return end
local thread = createThread(function(timer) -- defer execution of lua code. important!
   do
     sleep(250)
     if (syntaxcheck) then return end
     mono_invoke_method(nil, mono_findMethod('','Achievement_TakeMeAlive', 'EarnAchievement'), getAddress('instanceAddress'), {})
   end
 end)

{$asm}
[DISABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0C // re-write and restore original achievement ID with  'Gone In 60 Seconds'
</AssemblerScript>
            </CheatEntry>
            <CheatEntry>
              <ID>142</ID>
              <Description>"Hey, what's this button do?"</Description>
              <VariableType>Auto Assembler Script</VariableType>
              <AssemblerScript>[ENABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 01 // replace achievement ID

{$lua}
if (syntaxcheck) then return end
local thread = createThread(function(timer) -- defer execution of lua code. important!
   do
     sleep(250)
     if (syntaxcheck) then return end
     mono_invoke_method(nil, mono_findMethod('','Achievement_TakeMeAlive', 'EarnAchievement'), getAddress('instanceAddress'), {})
   end
 end)

{$asm}
[DISABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0C // re-write and restore original achievement ID with  'Gone In 60 Seconds'
</AssemblerScript>
            </CheatEntry>
            <CheatEntry>
              <ID>171</ID>
              <Description>"Hotshot"</Description>
              <VariableType>Auto Assembler Script</VariableType>
              <AssemblerScript>[ENABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 02 // replace achievement ID

{$lua}
if (syntaxcheck) then return end
local thread = createThread(function(timer) -- defer execution of lua code. important!
   do
     sleep(250)
     if (syntaxcheck) then return end
     mono_invoke_method(nil, mono_findMethod('','Achievement_TakeMeAlive', 'EarnAchievement'), getAddress('instanceAddress'), {})
   end
 end)

{$asm}
[DISABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0C // re-write and restore original achievement ID with  'Gone In 60 Seconds'
</AssemblerScript>
            </CheatEntry>
            <CheatEntry>
              <ID>165</ID>
              <Description>"It belongs in a museum!"</Description>
              <VariableType>Auto Assembler Script</VariableType>
              <AssemblerScript>[ENABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 09 // replace achievement ID

{$lua}
if (syntaxcheck) then return end
local thread = createThread(function(timer) -- defer execution of lua code. important!
   do
     sleep(250)
     if (syntaxcheck) then return end
     mono_invoke_method(nil, mono_findMethod('','Achievement_TakeMeAlive', 'EarnAchievement'), getAddress('instanceAddress'), {})
   end
 end)

{$asm}
[DISABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0C // re-write and restore original achievement ID with  'Gone In 60 Seconds'
</AssemblerScript>
            </CheatEntry>
            <CheatEntry>
              <ID>143</ID>
              <Description>"It was worth a shot."</Description>
              <VariableType>Auto Assembler Script</VariableType>
              <AssemblerScript>[ENABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 03 // replace achievement ID

{$lua}
if (syntaxcheck) then return end
local thread = createThread(function(timer) -- defer execution of lua code. important!
   do
     sleep(250)
     if (syntaxcheck) then return end
     mono_invoke_method(nil, mono_findMethod('','Achievement_TakeMeAlive', 'EarnAchievement'), getAddress('instanceAddress'), {})
   end
 end)

{$asm}
[DISABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0C // re-write and restore original achievement ID with  'Gone In 60 Seconds'
</AssemblerScript>
            </CheatEntry>
            <CheatEntry>
              <ID>159</ID>
              <Description>"Mica's Wrath"</Description>
              <VariableType>Auto Assembler Script</VariableType>
              <AssemblerScript>[ENABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0F // replace achievement ID

{$lua}
if (syntaxcheck) then return end
local thread = createThread(function(timer) -- defer execution of lua code. important!
   do
     sleep(250)
     if (syntaxcheck) then return end
     mono_invoke_method(nil, mono_findMethod('','Achievement_TakeMeAlive', 'EarnAchievement'), getAddress('instanceAddress'), {})
   end
 end)

{$asm}
[DISABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0C // re-write and restore original achievement ID with  'Gone In 60 Seconds'
</AssemblerScript>
            </CheatEntry>
            <CheatEntry>
              <ID>161</ID>
              <Description>"Mmmm, Carcinogens..."</Description>
              <VariableType>Auto Assembler Script</VariableType>
              <AssemblerScript>[ENABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0D // replace achievement ID

{$lua}
if (syntaxcheck) then return end
local thread = createThread(function(timer) -- defer execution of lua code. important!
   do
     sleep(250)
     if (syntaxcheck) then return end
     mono_invoke_method(nil, mono_findMethod('','Achievement_TakeMeAlive', 'EarnAchievement'), getAddress('instanceAddress'), {})
   end
 end)

{$asm}
[DISABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0C // re-write and restore original achievement ID with  'Gone In 60 Seconds'
</AssemblerScript>
            </CheatEntry>
            <CheatEntry>
              <ID>163</ID>
              <Description>"Pchooooooo!"</Description>
              <VariableType>Auto Assembler Script</VariableType>
              <AssemblerScript>[ENABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0B // replace achievement ID

{$lua}
if (syntaxcheck) then return end
local thread = createThread(function(timer) -- defer execution of lua code. important!
   do
     sleep(250)
     if (syntaxcheck) then return end
     mono_invoke_method(nil, mono_findMethod('','Achievement_TakeMeAlive', 'EarnAchievement'), getAddress('instanceAddress'), {})
   end
 end)

{$asm}
[DISABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0C // re-write and restore original achievement ID with  'Gone In 60 Seconds'
</AssemblerScript>
            </CheatEntry>
            <CheatEntry>
              <ID>169</ID>
              <Description>"Rigidbody"</Description>
              <VariableType>Auto Assembler Script</VariableType>
              <AssemblerScript>[ENABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 05 // replace achievement ID

{$lua}
if (syntaxcheck) then return end
local thread = createThread(function(timer) -- defer execution of lua code. important!
   do
     sleep(250)
     if (syntaxcheck) then return end
     mono_invoke_method(nil, mono_findMethod('','Achievement_TakeMeAlive', 'EarnAchievement'), getAddress('instanceAddress'), {})
   end
 end)

{$asm}
[DISABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0C // re-write and restore original achievement ID with  'Gone In 60 Seconds'
</AssemblerScript>
            </CheatEntry>
            <CheatEntry>
              <ID>141</ID>
              <Description>"You've met a terrible fate."</Description>
              <VariableType>Auto Assembler Script</VariableType>
              <AssemblerScript>[ENABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 00 // replace achievement ID

{$lua}
if (syntaxcheck) then return end
local thread = createThread(function(timer) -- defer execution of lua code. important!
   do
     sleep(250)
     if (syntaxcheck) then return end
     mono_invoke_method(nil, mono_findMethod('','Achievement_TakeMeAlive', 'EarnAchievement'), getAddress('instanceAddress'), {})
   end
 end)

{$asm}
[DISABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0C // re-write and restore original achievement ID with  'Gone In 60 Seconds'
</AssemblerScript>
            </CheatEntry>
            <CheatEntry>
              <ID>178</ID>
              <Description>"Echoes of the Eye"</Description>
              <Color>808000</Color>
              <GroupHeader>1</GroupHeader>
              <CheatEntries>
                <CheatEntry>
                  <ID>179</ID>
                  <Description>"Around the world in 90 seconds"</Description>
                  <VariableType>Auto Assembler Script</VariableType>
                  <AssemblerScript>[ENABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 11 // replace achievement ID

{$lua}
if (syntaxcheck) then return end
local thread = createThread(function(timer) -- defer execution of lua code. important!
   do
     sleep(250)
     if (syntaxcheck) then return end
     mono_invoke_method(nil, mono_findMethod('','Achievement_TakeMeAlive', 'EarnAchievement'), getAddress('instanceAddress'), {})
   end
 end)

{$asm}
[DISABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0C // re-write and restore original achievement ID with  'Gone In 60 Seconds'
</AssemblerScript>
                </CheatEntry>
                <CheatEntry>
                  <ID>177</ID>
                  <Description>"The Silenced Cartographer (free Title Update)"</Description>
                  <VariableType>Auto Assembler Script</VariableType>
                  <AssemblerScript>[ENABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 12 // replace achievement ID

{$lua}
if (syntaxcheck) then return end
local thread = createThread(function(timer) -- defer execution of lua code. important!
   do
     sleep(250)
     if (syntaxcheck) then return end
     mono_invoke_method(nil, mono_findMethod('','Achievement_TakeMeAlive', 'EarnAchievement'), getAddress('instanceAddress'), {})
   end
 end)

{$asm}
[DISABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0C // re-write and restore original achievement ID with  'Gone In 60 Seconds'
</AssemblerScript>
                </CheatEntry>
                <CheatEntry>
                  <ID>183</ID>
                  <Description>"Tubular"</Description>
                  <VariableType>Auto Assembler Script</VariableType>
                  <AssemblerScript>[ENABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 13 // replace achievement ID

{$lua}
if (syntaxcheck) then return end
local thread = createThread(function(timer) -- defer execution of lua code. important!
   do
     sleep(250)
     if (syntaxcheck) then return end
     mono_invoke_method(nil, mono_findMethod('','Achievement_TakeMeAlive', 'EarnAchievement'), getAddress('instanceAddress'), {})
   end
 end)

{$asm}
[DISABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0C // re-write and restore original achievement ID with  'Gone In 60 Seconds'
</AssemblerScript>
                </CheatEntry>
                <CheatEntry>
                  <ID>182</ID>
                  <Description>"Early Adopter"</Description>
                  <VariableType>Auto Assembler Script</VariableType>
                  <AssemblerScript>[ENABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 14 // replace achievement ID

{$lua}
if (syntaxcheck) then return end
local thread = createThread(function(timer) -- defer execution of lua code. important!
   do
     sleep(250)
     if (syntaxcheck) then return end
     mono_invoke_method(nil, mono_findMethod('','Achievement_TakeMeAlive', 'EarnAchievement'), getAddress('instanceAddress'), {})
   end
 end)

{$asm}
[DISABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0C // re-write and restore original achievement ID with  'Gone In 60 Seconds'
</AssemblerScript>
                </CheatEntry>
                <CheatEntry>
                  <ID>181</ID>
                  <Description>"The Grate Filter"</Description>
                  <VariableType>Auto Assembler Script</VariableType>
                  <AssemblerScript>[ENABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 15 // replace achievement ID

{$lua}
if (syntaxcheck) then return end
local thread = createThread(function(timer) -- defer execution of lua code. important!
   do
     sleep(250)
     if (syntaxcheck) then return end
     mono_invoke_method(nil, mono_findMethod('','Achievement_TakeMeAlive', 'EarnAchievement'), getAddress('instanceAddress'), {})
   end
 end)

{$asm}
[DISABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0C // re-write and restore original achievement ID with  'Gone In 60 Seconds'
</AssemblerScript>
                </CheatEntry>
                <CheatEntry>
                  <ID>180</ID>
                  <Description>"Flat Hearther"</Description>
                  <VariableType>Auto Assembler Script</VariableType>
                  <AssemblerScript>[ENABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 16 // replace achievement ID

{$lua}
if (syntaxcheck) then return end
local thread = createThread(function(timer) -- defer execution of lua code. important!
   do
     sleep(250)
     if (syntaxcheck) then return end
     mono_invoke_method(nil, mono_findMethod('','Achievement_TakeMeAlive', 'EarnAchievement'), getAddress('instanceAddress'), {})
   end
 end)

{$asm}
[DISABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0C // re-write and restore original achievement ID with  'Gone In 60 Seconds'
</AssemblerScript>
                </CheatEntry>
                <CheatEntry>
                  <ID>191</ID>
                  <Description>"Celsius 232.78"</Description>
                  <VariableType>Auto Assembler Script</VariableType>
                  <AssemblerScript>[ENABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 17 // replace achievement ID

{$lua}
if (syntaxcheck) then return end
local thread = createThread(function(timer) -- defer execution of lua code. important!
   do
     sleep(250)
     if (syntaxcheck) then return end
     mono_invoke_method(nil, mono_findMethod('','Achievement_TakeMeAlive', 'EarnAchievement'), getAddress('instanceAddress'), {})
   end
 end)

{$asm}
[DISABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0C // re-write and restore original achievement ID with  'Gone In 60 Seconds'
</AssemblerScript>
                </CheatEntry>
                <CheatEntry>
                  <ID>184</ID>
                  <Description>"Ghosts in the Machine"</Description>
                  <VariableType>Auto Assembler Script</VariableType>
                  <AssemblerScript>[ENABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 18 // replace achievement ID

{$lua}
if (syntaxcheck) then return end
local thread = createThread(function(timer) -- defer execution of lua code. important!
   do
     sleep(250)
     if (syntaxcheck) then return end
     mono_invoke_method(nil, mono_findMethod('','Achievement_TakeMeAlive', 'EarnAchievement'), getAddress('instanceAddress'), {})
   end
 end)

{$asm}
[DISABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0C // re-write and restore original achievement ID with  'Gone In 60 Seconds'
</AssemblerScript>
                </CheatEntry>
                <CheatEntry>
                  <ID>190</ID>
                  <Description>"Sleep. Wake. Repeat."</Description>
                  <VariableType>Auto Assembler Script</VariableType>
                  <AssemblerScript>[ENABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 19 // replace achievement ID

{$lua}
if (syntaxcheck) then return end
local thread = createThread(function(timer) -- defer execution of lua code. important!
   do
     sleep(250)
     if (syntaxcheck) then return end
     mono_invoke_method(nil, mono_findMethod('','Achievement_TakeMeAlive', 'EarnAchievement'), getAddress('instanceAddress'), {})
   end
 end)

{$asm}
[DISABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0C // re-write and restore original achievement ID with  'Gone In 60 Seconds'
</AssemblerScript>
                </CheatEntry>
                <CheatEntry>
                  <ID>189</ID>
                  <Description>"Simulation Hypothesis"</Description>
                  <VariableType>Auto Assembler Script</VariableType>
                  <AssemblerScript>[ENABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 1A // replace achievement ID

{$lua}
if (syntaxcheck) then return end
local thread = createThread(function(timer) -- defer execution of lua code. important!
   do
     sleep(250)
     if (syntaxcheck) then return end
     mono_invoke_method(nil, mono_findMethod('','Achievement_TakeMeAlive', 'EarnAchievement'), getAddress('instanceAddress'), {})
   end
 end)

{$asm}
[DISABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0C // re-write and restore original achievement ID with  'Gone In 60 Seconds'
</AssemblerScript>
                </CheatEntry>
                <CheatEntry>
                  <ID>188</ID>
                  <Description>"Fire Arrows"</Description>
                  <VariableType>Auto Assembler Script</VariableType>
                  <AssemblerScript>[ENABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 1B // replace achievement ID

{$lua}
if (syntaxcheck) then return end
local thread = createThread(function(timer) -- defer execution of lua code. important!
   do
     sleep(250)
     if (syntaxcheck) then return end
     mono_invoke_method(nil, mono_findMethod('','Achievement_TakeMeAlive', 'EarnAchievement'), getAddress('instanceAddress'), {})
   end
 end)

{$asm}
[DISABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0C // re-write and restore original achievement ID with  'Gone In 60 Seconds'
</AssemblerScript>
                </CheatEntry>
                <CheatEntry>
                  <ID>187</ID>
                  <Description>"1/900"</Description>
                  <VariableType>Auto Assembler Script</VariableType>
                  <AssemblerScript>[ENABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 1C // replace achievement ID

{$lua}
if (syntaxcheck) then return end
local thread = createThread(function(timer) -- defer execution of lua code. important!
   do
     sleep(250)
     if (syntaxcheck) then return end
     mono_invoke_method(nil, mono_findMethod('','Achievement_TakeMeAlive', 'EarnAchievement'), getAddress('instanceAddress'), {})
   end
 end)

{$asm}
[DISABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0C // re-write and restore original achievement ID with  'Gone In 60 Seconds'
</AssemblerScript>
                </CheatEntry>
                <CheatEntry>
                  <ID>186</ID>
                  <Description>"You'll Never Take Me Alive!"</Description>
                  <VariableType>Auto Assembler Script</VariableType>
                  <AssemblerScript>[ENABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 1D // replace achievement ID

{$lua}
if (syntaxcheck) then return end
local thread = createThread(function(timer) -- defer execution of lua code. important!
   do
     sleep(250)
     if (syntaxcheck) then return end
     mono_invoke_method(nil, mono_findMethod('','Achievement_TakeMeAlive', 'EarnAchievement'), getAddress('instanceAddress'), {})
   end
 end)

{$asm}
[DISABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0C // re-write and restore original achievement ID with  'Gone In 60 Seconds'
</AssemblerScript>
                </CheatEntry>
                <CheatEntry>
                  <ID>185</ID>
                  <Description>"Oof Ouch, My Bones"</Description>
                  <VariableType>Auto Assembler Script</VariableType>
                  <AssemblerScript>[ENABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 1E // replace achievement ID

{$lua}
if (syntaxcheck) then return end
local thread = createThread(function(timer) -- defer execution of lua code. important!
   do
     sleep(250)
     if (syntaxcheck) then return end
     mono_invoke_method(nil, mono_findMethod('','Achievement_TakeMeAlive', 'EarnAchievement'), getAddress('instanceAddress'), {})
   end
 end)

{$asm}
[DISABLE]
Achievement_TakeMeAlive:EarnAchievement+f+1:
db 0C // re-write and restore original achievement ID with  'Gone In 60 Seconds'
</AssemblerScript>
                </CheatEntry>
              </CheatEntries>
            </CheatEntry>
          </CheatEntries>
        </CheatEntry>
      </CheatEntries>
    </CheatEntry>
    <CheatEntry>
      <ID>38</ID>
      <Description>"DEBUG (enable this first)"</Description>
      <Options moHideChildren="1"/>
      <Color>0000FA</Color>
      <GroupHeader>1</GroupHeader>
      <CheatEntries>
        <CheatEntry>
          <ID>33</ID>
          <Description>"instanceAddress"</Description>
          <ShowAsSigned>0</ShowAsSigned>
          <Color>0000FA</Color>
          <VariableType>Array of byte</VariableType>
          <ByteLength>0</ByteLength>
          <Address>instanceAddress</Address>
          <CheatEntries>
            <CheatEntry>
              <ID>128</ID>
              <Description>"_jumped"</Description>
              <ShowAsSigned>0</ShowAsSigned>
              <VariableType>Byte</VariableType>
              <Address>+38</Address>
            </CheatEntry>
            <CheatEntry>
              <ID>136</ID>
              <Description>"_timeOfJump"</Description>
              <ShowAsSigned>0</ShowAsSigned>
              <VariableType>Float</VariableType>
              <Address>+3C</Address>
              <CheatEntries>
                <CheatEntry>
                  <ID>172</ID>
                  <Description>"_timeOfJump (hex)"</Description>
                  <ShowAsHex>1</ShowAsHex>
                  <ShowAsSigned>0</ShowAsSigned>
                  <VariableType>Float</VariableType>
                  <Address>+0</Address>
                </CheatEntry>
              </CheatEntries>
            </CheatEntry>
          </CheatEntries>
        </CheatEntry>
      </CheatEntries>
    </CheatEntry>
  </CheatEntries>
  <UserdefinedSymbols>
    <SymbolEntry>
      <Name>instanceAddress</Name>
      <Address>2116CD6F500</Address>
    </SymbolEntry>
  </UserdefinedSymbols>
</CheatTable>
