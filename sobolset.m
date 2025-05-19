classdef sobolset
    % Minimal wrapper for MATLAB's sobolset using stk_sampling_sobol (Octave)
    
    properties
        Dimensions      % Number of dimensions
        Skip = 0        % Number of initial points to skip
        Leap = 0        % Interval between points (leaping)
        ScrambleMethod = struct('Type', '', 'Options', {})  % Scramble settings (ignored)
    end
    
    methods
        function obj = sobolset(D, varargin)
            obj.Dimensions = D;
            % Parse optional name-value pairs
            for k = 1:2:length(varargin)
                name = varargin{k};
                value = varargin{k+1};
                switch lower(name)
                    case 'skip'
                        obj.Skip = value;
                    case 'leap'
                        obj.Leap = value;
                    case 'scramblemethod'
                        obj.ScrambleMethod = value;
                    otherwise
                        warning('sobolset: unknown property ''%s'' ignored', name);
                end
            end
        end
        
        function obj = scramble(obj, ~)
            % Scramble is ignored in this wrapper
        end
        
        function X = net(obj, N)
            % Generate Sobol points with skip and leap applied
            totalPoints = obj.Skip + (N - 1) * (obj.Leap + 1) + 1;
            pts = stk_sampling_sobol(totalPoints, obj.Dimensions, [], true);
            indices = obj.Skip + 1 : obj.Leap + 1 : totalPoints;
            X = pts(indices, :);
        end
    end
end
