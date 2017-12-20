% Homework 5
% Memory Game
%
% Chinasa T. Okolo
% October 11th, 2017
% PHYS 108
%

%-------------------------------------------------------------------%
% Problem 5
%-------------------------------------------------------------------%

% Play the game!
playGame()

%-------------------------------------------------------------------%
% FUNCTIONS FOR MEMORY GAME
%-------------------------------------------------------------------%

function [gameBoard, userBoard] = createBoards(int)

% Create n x n cell matrix
gameBoard = cell(int);

% Creates array of X's for user
userBoard = cell(int);
userBoard(:) = {"X"};

end

function animalGameBoard = fillBoard(gameBoard)
% Load array of animal names
load('animals.mat', 'animals')

% Generate arrays needed 
boardSize = length(gameBoard);
numAnimals = (length(gameBoard)^2)/2;
animalNamesSize = randperm(length(animals), numAnimals);

% Create animal vector from animals.txt file
    for i = 1:numAnimals
        animalVec(i) = animals(animalNamesSize(i));
    end

% Create new array with duplicated animal names to get pairs
dupAnimalVec = repelem(animalVec,2);

% Randomly shuffle array
randomAnimalArray = dupAnimalVec(randperm(length(dupAnimalVec)));

% Create board with matching pairs
animalGameBoard = cell(boardSize);

    for i = 1:numel(randomAnimalArray)
      animalGameBoard{i} = randomAnimalArray(i);
    end

end

function newUserBoard = changeBoard(loc1, loc2, animalBoard, userBoard)

% Change user board to show elements
userBoard{loc1} = animalBoard{loc1};
userBoard{loc2} = animalBoard{loc2};

% Assign new board
newUserBoard = userBoard;

end


function playGame()
disp('Welcome to my game! To play, continue.') 
disp('To quit at any time press Ctrl-C (Windows + Mac)')

% Ask user for input
prompt = 'How big do you want your game to be? (Choose an even integer > 0) ';
gameSize = input(prompt);

% Create boards based on input
[gameBoard, userBoard] = createBoards(gameSize);

% Show user their board
disp('Here is your board: ')
disp(userBoard)

% Create animal game board 
animalGameBoard = fillBoard(gameBoard);

% Iterate so user can continue selecting locations
while (~(isequal(userBoard,animalGameBoard)))
    % Ask user to select two locations (from 1 - # cells in board)
    prompt2 = 'Select first location (Choose integer from 1 - n*n) ';
    loc_1 = input(prompt2);
    
    prompt3 = 'Select second location (Choose integer from 1 - n*n) ';
    loc_2 = input(prompt3);

    % Show users animals at selected cells
    locationOne = animalGameBoard{loc_1};
    locationTwo = animalGameBoard{loc_2};

    disp('Here are your selected cells: ')
    disp(locationOne)
    disp(locationTwo)

    % Generate new user board if selected cells were correct
    if (locationOne == locationTwo)
        newUserBoard = changeBoard(loc_1,loc_2,animalGameBoard,userBoard);
        userBoard = newUserBoard;
        clc;
    else % Clear command window and continue playing
        clc;
    end
    
% Show user their board
disp('Here is your board: ')
disp(userBoard)

end

disp('Congratulations, you won!')

end
