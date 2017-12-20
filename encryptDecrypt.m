% Encrypt and Decrypt a string in MATLAB (Ceasar Cipher)

function outputString = encryptString(str, posInt)

% Initialize output string
outputString = str;

% Check if integer is between 0 and 25
    if (posInt > 0 && posInt <=25)
   
        % Iterate through string and encrypt
        for i = 1:length(str)

            if (isletter(str(i)))
               % Shifted ASCII value
               currASCII = char(str(i)) + posInt;
               
               % Mod functions for conversions
               changeUpper = mod((currASCII), 90);
               changeLower = mod((currASCII), 122);
            
               % Make sure uppercase stays upper
               if (str(i) == upper(str(i)))
                   if (currASCII <= 90)
                      outputString(i) = char(currASCII);
                   % Use mod to start at 'A' if needed
                   else
                      newCharNum = changeUpper + 64;
                      outputString(i) = char(newCharNum);   
                   end
               else % Make sure lowercase stays lower
                   if (currASCII <= 122)
                      outputString(i) = char(currASCII);
                   else
                      newCharNum = changeLower + 96;
                      outputString(i) = char(newCharNum);
                   end
               end
               
            % Ignore all non-letters
            else
                outputString(i) = str(i);
            end
        end
    else
        disp('error: Integer not within specified range')
    end
    
end

% Decrypt a string
function outputString = decryptString(str, shiftInt)

% Initialize output string
outputString = str;

% Check if integer is between 0 and 25
    if (shiftInt > 0 && shiftInt <=25)
   
        % Iterate through string and encrypt
        for i = 1:length(str)

            if (isletter(str(i)))
               % Shifted ASCII value
               currASCII = char(str(i)) - shiftInt;
               
               % Mod functions for conversions
               changeUpper = mod(65, (currASCII));
               changeLower = mod(97, (currASCII));
            
               % Make sure uppercase stays upper
               if (str(i) == upper(str(i)))
                   % Use mod to start at 'A' if needed
                   if (currASCII < 65)
                       newCharNum = 91 - changeUpper;
                       outputString(i) = char(newCharNum);
                   else
                       outputString(i) = char(currASCII);  
                   end
               else % Make sure lowercase stays lower
                   if (currASCII < 97)
                       newCharNum = 123 - changeLower;
                       outputString(i) = char(newCharNum);
                   else
                       outputString(i) = char(currASCII);
                   end
               end
               
            % Ignore all non-letters
            else
                outputString(i) = str(i);
            end
        end
    else
        disp('error: Integer not within specified range')
    end

end


% Score "likelihood" that phrase is found in English language
function likelihood = scoreLike(str, shiftInt)

wordToCount = decryptString(str, shiftInt);
likelihood = 0;

% Create new vector to hold frequencies of each letter in string
freqVec = zeros(size(wordToCount));

% Lookup table that holds frequencies (in percents) 
freqLookupTable = struct('a', 8.167,'b', 1.492,'c', 2.782,'d',4.253,...
                 'e', 12.702,'f', 2.228,'g', 2.015,'h', 6.094,'i',6.966,...
                 'j', 0.153,'k', 0.772,'l', 4.025,'m', 2.406,'n',6.749,...
                 'o', 7.507,'p', 1.929,'q', 0.095,'r', 5.987,'s',6.327,...
                 't', 9.056,'u', 2.758,'v', 0.978,'w', 2.360,'x',0.150,...
                 'y', 1.974,'z', 0.074);

    % Frequency for each letter in string
    for i = 1:length(wordToCount)
        if (isletter(wordToCount(i)))
            likelihood = likelihood + freqLookupTable.(lower(wordToCount(i)));
        end
    end

end

