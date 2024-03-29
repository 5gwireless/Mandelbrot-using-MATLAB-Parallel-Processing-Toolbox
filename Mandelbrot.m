% ENSC180-Assignment3

% Student Name 1: Danica Walton

% Student 1 #: 3010304050

% Student 1 userid (email): danicaw@sfu.ca

% Student Name 2: Nick Skinner

% Student 2 #: 301305070

% Student 2 userid (email): nskinner@sfu.ca

% Below, edit to list any people who helped you with the assignment, 
%      or put ?none? if nobody helped (the two of) you.

% Helpers: Arvin Amini, George Lertzman-Lepofsky, Scott Bernard

% Instructions:
% * Put your name(s), student number(s), userid(s) in the above section.
% * Edit the "Helpers" line.  
% * Your group name should be "A3_<userid1>_<userid2>" (eg. A3_stu1_stu2)
% * Form a group 
%   as described at:  https://courses.cs.sfu.ca/docs/students
% * You will submit THIS file (assignment3_2017.m),    
%   and your video file (assignment3.avi or possibly similar).
% Craig Scratchley, Spring 2017

function frameArray = assignment3_2017

MAX_FRAMES = 400; % you can change this and consider increasing it.
RESOLUTION = 50; % you can change this and consider increasing it.
DURATION = 90; % Duration of video -- you can change this if you want.

% Colors
%MAX_DEPTH = 100; % you will probably need to increase this.
%CMAP=colormap(flipud(lines(MAX_DEPTH))); %change the colormap as you want.

WRITE_VIDEO_TO_FILE = true; % change this as you like (true/false)
DO_IN_PARALLEL = true; %change this as you like (true/false)

if DO_IN_PARALLEL
    startClusterIfNeeded
end

if WRITE_VIDEO_TO_FILE
    openVideoFile
end

if DO_IN_PARALLEL || ~WRITE_VIDEO_TO_FILE 
    %preallocate struct array
    %frameArray=struct('cdata',cell(1,MAX_FRAMES),'colormap',cell(1,MAX_FRAMES));
end
%Rotation
function res = rotation(radius, angle)
	%turn angle into radians 
	a = angle*pi/180;
	x = radius*cos(a);
	y = radius*sin(a)*1i;
	res = x+y;
end
	
% the path "around" the mandelbrot set, associating centres of frames
%     with zoom (magnification) levels.  

%           index  centre      number of times to zoom in by 2
PATH_POINTS = [0, -0.5, 0;
               100, 0.5, 0.15;
               %Mini Mandelbrot (top) 1
               200, -0.130949275307-0.988748193393i, 1.4e-1;
               400, -0.130949275307-0.988748193393i, 1.4e-3;
               600, -0.130949275307-0.988748193393i, 1.4e-5;
               800, -0.130949275307-0.988748193393i, 1.4e-7;
               1000, -0.130949275307-0.988748193393i, 5.4e-9;
               1100, -0.130949275307-0.988748193393i, rotation(1.4e-10*1.5, 45);
               1200, -0.130949275307-0.988748193393i, rotation(1.4e-10*1.5, 90);%rotate out
               1300, -0.130949275307-0.988748193393i, rotation(1.4e-10*1.5, 135);%rotating 45deg for all these
               1400, -0.130949275307-0.988748193393i, rotation(1.4e-10*1.5, 180);
               1600, -0.130949275307-0.988748193393i, rotation(1.4e-8*1.5, 225);
			   1800, -0.130949275307-0.988748193393i, rotation(1.4e-6*1.5, 270)
			   2000, -0.130949275307-0.988748193393i, rotation(1.4e-4*1.5, 315)
			   2200, -0.130949275307-0.988748193393i, rotation(1.4e-2*1.5, 0);

               %Mini Mandelbrot (top) 2
			   
               2400, -0.183363426870-1.091524665445i, 1.4e-2;
               2600, -0.183363426870-1.091524665445i, 1.4e-4;
			   2800, -0.183363426870-1.091524665445i, 1.4e-6;
			   3000, -0.183363426870-1.091524665445i, 1.4e-9;
               3200, -0.183363426870-1.091524665445i, 1.4e-10;
               3400, -0.183363426870-1.091524665445i, 1.4e-11;
               3500, -0.183363426870-1.091524665445i, rotation(1.4e-11*1.5, -45);
			   3600, -0.183363426870-1.091524665445i, rotation(1.4e-11*1.5, -90);
			   3700, -0.183363426870-1.091524665445i, rotation(1.4e-11*1.5, -135);
			   3800, -0.183363426870-1.091524665445i, rotation(1.4e-11*1.5, -180);
			   3900, -0.183363426870-1.091524665445i, rotation(1.4e-11*1.5, -225);
			   4000, -0.183363426870-1.091524665445i, rotation(1.4e-11*1.5, -270);
			   4100, -0.183363426870-1.091524665445i, rotation(1.4e-11*1.5, -315);
			   4200, -0.183363426870-1.091524665445i, rotation(1.4e-11*1.5, 0);
			   4400, -0.183363426870-1.091524665445i, rotation(1.4e-10*1.5, 45);
               4600, -0.183363426870-1.091524665445i, rotation(1.4e-10*1.5, 90);
               4800, -0.183363426870-1.091524665445i, rotation(1.4e-10*1.5, 135);
               5000, -0.183363426870-1.091524665445i, rotation(1.4e-10*1.5, 180);
			   5200, -0.183363426870-1.091524665445i, rotation(1.4e-10*1.5, 225);%this is 360deg
			   5400, -0.183363426870-1.091524665445i, rotation(1.4e-10*1.5, 270);
               5600, -0.183363426870-1.091524665445i, rotation(1.4e-10*1.5, 315);
               %Seahorse Valley
               5800, -0.744768288582+0.209355595500i, rotation(0.025*1.5, 0);
               6000, -0.744768288582+0.209355595500i, rotation(1.4e-2*1.5, 45);
               6200, -0.744768288582+0.209355595500i, rotation(1.4e-4*1.5, 90);
			   6400, -0.744768288582+0.209355595500i, rotation(1.4e-6*1.5, 135);
               6600, -0.744768288582+0.209355595500i, rotation(1.4e-7*1.5, 180);
			   6700, -0.744768288582+0.209355595500i, rotation(1.4e-7*1.5, 225);
			   6800, -0.744768288582+0.209355595500i, rotation(1.4e-7*1.5, 270);
			   6900, -0.744768288582+0.209355595500i, rotation(1.4e-7*1.5, 315);
			   7000, -0.744768288582+0.209355595500i, rotation(1.4e-7*1.5, 0);
			   7100, -0.744768288582+0.209355595500i, rotation(1.4e-7*1.5, -45);
			   7200, -0.744768288582+0.209355595500i, rotation(1.4e-7*1.5, -90);
			   7300, -0.744768288582+0.209355595500i, rotation(1.4e-7*1.5, -135);
			   7400, -0.744768288582+0.209355595500i, rotation(1.4e-7*1.5, -180);%rotate all the time 
               7600, -0.744768288582+0.209355595500i, rotation(1.4e-6*1.5, -225);
               7800, -0.744768288582+0.209355595500i, rotation(1.4e-4*1.5, -270);
               8000, -0.744768288582+0.209355595500i, rotation(1.4e-2*1.5, -315);
               8200, -0.744768288582+0.209355595500i, rotation(0.025*1.5, 0);
               %Mini Mandelbrot 1 (left on 0y axis)
               8400, -1.635393946990, 0.025;
               8600, -1.635393946990, 1.4e-2;
               8800, -1.635393946990, 1.4e-4;
               9000, -1.635393946990, 1.4e-7;
               9200, -1.635393946990, 1e-9;
               9400, -1.635393946990, 1.4e-8;
               9600, -1.635393946990, 1.4e-6;
               9800, -1.635393946990, 1.4e-4;
               10000, -1.635393946990, 1.4e-2;
               %Mini Mandelbrot 2 (left on 0y axis)
               10200, -1.999943522202, 1.4e-2;
               10400, -1.999943522202, 1.4e-3;
               10600, -1.999943522202, rotation(1.4e-5*1.5, 45);%rotate 45
               10800, -1.999943522202, rotation(1.4e-6*1.5, 90);%rotate another 45
               11000, -1.999943522202, 1.4e-8; 
               11200, -1.999943522202, 1.4e-10;
               11400, -1.999943522202, 1.4e-8;   
               11600, -1.999943522202, rotation(1.4e-6*1.5, 270);%rotate 180
               11800, -1.999943522202, rotation(1.4e-4*1.5, 315);%rotate 45
               12000, -1.999943522202, 1.4e-2;
               12200, -1.999943522202, 0.025;
			   12400, 0, rotation(0.10*1.5, 0);]
			   
         
DEPTH_POINTS = [0, 100;
               100, 100;
               200, 200;
               400, 300;
               600, 500;
               800, 700;
               1000, 1300;
			   1100, 1300;
			   1200, 1300;
			   1300, 1300;
			   1400, 1300;
               1600, 700;
               1800, 500;
               2000, 300;
               2200, 100;

               2400, 200;
               2600, 400;
			   2800, 600;
			   3000, 800;
               3200, 1100;
               3400, 1300;
               3500, 1300;
			   3600, 1300;
			   3700, 1300;
			   3800, 1300;
			   3900, 1300;
			   4000, 1300;
			   4100, 1300;
			   4200, 1300;
               4400, 1100;
               4600, 1100;
               4800, 800;
			   5000, 600;
			   5200, 400;
               5400, 200;
			   5600, 100;
			   
               5800, 100;
               6000, 400;
               6200, 800;
			   6400, 1000;
               6700, 1500;
			   6800, 1500;
			   6900, 1500;
			   7000, 1500;
			   7100, 1500;
			   7200, 1500;
			   7300, 1500;
			   7400, 1500;
               7600, 1000;
               7800, 400;
               8000, 200;
               8200, 100;
               
               8400, 100;
               8600, 200;
               8800, 400;
               9000, 800;
               9200, 1400;
               9400, 800;
               9600, 400;
               9800, 200;
               10000, 100;
               
               10200, 100;
               10400, 200;
               10600, 400;
               10800, 600;
               11000, 900;
               11200, 1200;
               11400, 900;
               11600, 700;
               11800, 600;
               12000, 400;
               12200, 500;
               12400, 100]
   

SIZE_0 = 1.5; % the "size" from the centre of a frame with no zooming.

% scale indexes to number of frames.
scaledIndexArray = PATH_POINTS(:, 1).*((MAX_FRAMES-1)/PATH_POINTS(end, 1));

% interpolate centres and zoom levels.
interpArray = interp1(scaledIndexArray, PATH_POINTS(:, 2:end), 0:(MAX_FRAMES-1), 'pchip');

zoomArray = interpArray(:,2); % zoom level of each frame

% ***** modify the below line to consider zoom levels.
sizeArray = SIZE_0 * ones(MAX_FRAMES,1).*zoomArray; % size from centre of each frame.

centreArray = interpArray(:,1);  % centre of each frame

DepthIndexArray = DEPTH_POINTS(:, 1).*((MAX_FRAMES-1)/DEPTH_POINTS(end, 1));

interpDepthArray = interp1(DepthIndexArray, DEPTH_POINTS(:, 2:end), 0:(MAX_FRAMES-1), 'pdchip');

iterateHandle = @iterate;

tic % begin timing
if DO_IN_PARALLEL
    parfor frameNum = 1:MAX_FRAMES
        %evaluate function iterate with handle iterateHandle
        frameArray(frameNum) = feval(iterateHandle, frameNum);
    end
else
    for frameNum = 1:MAX_FRAMES
        if WRITE_VIDEO_TO_FILE
            %frame has already been written in this case
            iterate(frameNum);
        else
            frameArray(frameNum) = iterate(frameNum);
        end
    end
end

if WRITE_VIDEO_TO_FILE
    if DO_IN_PARALLEL
        writeVideo(vidObj, frameArray);
    end
    close(vidObj);
    toc %end timing
else
    toc %end timing
    %clf;
    set(gcf, 'Position', [100, 100, RESOLUTION + 10, RESOLUTION + 10]);
    axis off;
    shg; % bring the figure to the top to be seen.
    movie(gcf, frameArray, 1, MAX_FRAMES/DURATION, [5, 5, 0, 0]);
end

    function frame = iterate (frameNum)

        centreX = real(centreArray(frameNum)); 
        centreY = imag(centreArray(frameNum)); 
        size = sizeArray(frameNum); 
        x = linspace(centreX - 16*size, centreX + 16*size, 16*RESOLUTION);
        %you can modify the aspect ratio if you want.
        y = linspace(centreY - 9*size, centreY + 9*size, 9*RESOLUTION);
        
        % the below might work okay unless you want to further optimize
        % Create the two-dimensional complex grid using meshgrid
        [X,Y] = meshgrid(x,y);
        z0 = X + 1i*Y;
        
        % Initialize the iterates and counts arrays.
        z = z0;
        
        % needed for mex, assumedly to make z elements separate
        %in memory from z0 elements.
        z(1,1) = z0(1,1); 
        
        % make c of type uint16 (unsigned 16-bit integer)
        c = zeros(9*RESOLUTION, 16*RESOLUTION, 'uint16');
        
        % Here is the Mandelbrot iteration.
        c(abs(z) < 2) = 1;
        
        % below line turns warning off for MATLAB R2015b and similar
        %   releases of MATLAB.  Those releases have a bug causing a 
        %   warning for mex invocations like ours.  
        % warning( 'off', 'MATLAB:lang:badlyScopedReturnValue' );

        depth = interpDepthArray(1,frameNum); % you can make depth dynamic if you want.
        CMAP=colormap(flipud(bone(round(depth))));
        
        for k = 2:depth
            [z,c] = mandelbrot_step(z,c,z0,k);
            % mandelbrot_step is a c-mex file that does one step of:
            %  z = z.^2 + z0;
            %  c(abs(z) < 2) = k;
        end
        
        % create an image from c and then convert to frame.  Use CMAP
        frame = im2frame(ind2rgb(c, CMAP));
        if WRITE_VIDEO_TO_FILE && ~DO_IN_PARALLEL
            writeVideo(vidObj, frame);
        end
        
        disp(['frame=' num2str(frameNum)]);
    end

    function startClusterIfNeeded
        myCluster = parcluster('local');
        if isempty(myCluster.Jobs) || ~strcmp(myCluster.Jobs(1).State, 'running')
            PHYSICAL_CORES = feature('numCores');
            
            % "hyperthreads" per physical core
            LOGICAL_PER_PHYSICAL = 2; %valid for the i7 on Craig's desktop
            
            % you can change the NUM_WORKERS calculation below if you want.
            NUM_WORKERS = (LOGICAL_PER_PHYSICAL + 1) * PHYSICAL_CORES;
            myCluster.NumWorkers = NUM_WORKERS;
            saveProfile(myCluster);
            disp('This may take a while when needed!')
            parpool(NUM_WORKERS);
        end
    end

    function openVideoFile
        % create video object
        vidObj = VideoWriter('assignment3');
        %vidObj.Quality = 100; % or consider changing
        vidObj.FrameRate = MAX_FRAMES/DURATION;
        open(vidObj);
    end

end


% Look at the mandelbrot_step.c file and compare with the mandelbrot_step.m file. What do you
% think is the primary optimization that file mandelbrot_step.c leverages? [5 points]
%{
C and C++ code in general tends to be much faster than MATLAB when processing large sets of data. 
The primary optimization that the c file leverages is that the C file uses pointers. When using 
pointers there are very few operations that are required when doing simple procedures such as swapping
matrices A and B for example. In MATLAB, swapping a matrix requires a third matrix and many more 
operations that in the C language using pointers. 
Source: http://stackoverflow.com/questions/20513071/performance-tradeoff-when-is-matlab-better-slower-than-c-c
%}
%{
Fill in the following comments depending on your focus area(s):
Area 1: Highlight the artistic and mathematical merit of your video/programming here:

As an artistic theme, we decided to find some of the mini mandelbrots that
are hidden in various parts of the large mandelbrot set. We thought it was
interesting that there are so many iterations of the mandelbrot set hidden
in the larger mandelbrot. Mathematically, these mini mandelbrots are not
identical, but the amount of them is infinite. In the mini mandelbrots
there are more mini madelbrots and in them some and it keeps going. The
infinite nature of the mandelbrot set was what inspired us to zoom in on
the mini mandelbrots.

To embelish the video, we added some stylistic rotations and changed the
colour to a map that changes gradient depending on depth. The colour map
was a personal preference of ours and we think that it emphasises what we
chose to zoom in on to its full potential.



%}

