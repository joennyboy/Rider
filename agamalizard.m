tic
MT(1) = 1; i = 1; totom = {};
% Give the kernel and enum
K = 3;
rng(1);
e = 0.2;
rng default % ->This is the important bit
window = 17;
 [filename, pathname] = uigetfile('firstfirst.csv');
  totom = readtable(filename);
  %  totom = readtable(filename);
    totom = normalize(totom);   
    A = table2array(totom(:,1));
    A(isnan(A))=0;
    yourvector1 = A(:);
    if  A == isempty(A)
        strangeness = 0;
         else
        % find the distance using k means
     
        [idx, ~, miro , D] = kmeans(A, K);
         mat1 = sort(D');
         strangeness = mat1(1,:)';
         a = strangeness(:,:);
         fnP=@(a,i)(sum(a(1:i) >  a(i))+0.8*sum(a(i)==a(1:i)))/i; 
          m = cell(5,1);
         [mf, ni] = size(D);
          parfor j = 2 : mf
            m{j} = feval(fnP,strangeness, j);
          end
               MTK = zeros(mf,1);
               for j = 2 : mf
    MTK(j) = e * [m{j}].^ (e - 1) ;
    
               end
               
MTK(isinf(MTK)|isnan(MTK)) = 0; % Replace NaNs and infinite values with zeros
oo = 'movmedian';
    MTx = smoothdata(MTK, oo, window);
    x1 = MTx/window;  
   
    y = x1; %Array of random numbers
    x = 1 : length(y);
grid on;
ko = mean(y);
meandev = mad(y,0,'all');
  N = 1 * meandev;
threshold1 = ko + (N);
moreThanThreshold1 = y > threshold1   ; % Logical indexes.
% Extract those over the threshold into new arrays.
over_x = x(moreThanThreshold1);
over_y = y(moreThanThreshold1);

plot(moreThanThreshold1);
% auii =  moreThanThreshold1 ;
% Aii = table2array( firstolu ) ;
% mutii = and(auii, Aii);
% igwee = or(mutii, Aii);
% disp(igwee);
% %plotconfusion(Aii', igwe')
% plot(igwee)
toc
    end   
   
    
    
    
    