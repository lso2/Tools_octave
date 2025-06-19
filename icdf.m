% Calls to icdf will use this wrapper, for octave compatibility
function varargout = icdf(distname, p, varargin)
  % Wrapper for icdf to make sure that P is numeric
  if ~isnumeric(p)
    % Try to convert to numeric, or replace with zeros if impossible
    try
      p = double(p);
    catch
      warning('icdf wrapper: input P is not numeric, replacing with zeros.');
      p = zeros(size(p));
    end
  end

  % Manual dispatch to distribution-specific inverse CDF functions
  switch lower(distname)
    case 'normal'
      [varargout{1:nargout}] = norminv(p, varargin{:});
    case 'lognormal'
      [varargout{1:nargout}] = logninv(p, varargin{:});
    case 'gamma'
      [varargout{1:nargout}] = gaminv(p, varargin{:});
    case 'weibull'
      [varargout{1:nargout}] = wblinv(p, varargin{:});
    case 'exponential'
      [varargout{1:nargout}] = expinv(p, varargin{:});
    case 'uniform'
      [varargout{1:nargout}] = unifinv(p, varargin{:});
    % Add more distributions here as needed
    otherwise
      error('icdf wrapper: distribution "%s" not supported.', distname);
  end
end
