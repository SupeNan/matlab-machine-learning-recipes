%% Demo of a Case-Based Expert System 
% This is for a case based system. It consists of a set of cases and a 
% catalog of states and values.
%
% This builds an expert system and demonstrates adding a new case.
%% See also:
% BuildExpertSystem, CBREngine


system = BuildExpertSystem( [], 'id',1,...
                            'catalog state name','wheel-turning',...
                            'catalog value',{'yes','no'},...
                            'id',2,...
                            'catalog state name','power',...
                            'catalog value',{'on' 'off'},...
                            'id',3,...
                            'catalog state name','torque-command',...
                            'catalog value',{'yes','no'},...
                            'id',1,...
                            'case name', 'Wheel operating',...
                            'case states',{'wheel-turning', 'power', 'torque-command'},...
                            'case values',{'yes' 'on' 'yes'},...
                            'case outcome','working',...
                            'id',2,...
                            'case name', 'Wheel power ambiguous',...
                            'case states',{'wheel-turning', 'power', 'torque-command'},...
                            'case values',{'yes' {'on' 'off'} 'no'},...
                            'case outcome','working',...
                            'id',3,...
                            'case name', 'Wheel broken',...
                            'case states',{'wheel-turning', 'power', 'torque-command'},...
                            'case values',{'no' 'on' 'yes'},...
                            'case outcome','broken',...
                            'id',4,...
                            'case name', 'Wheel turning',...
                            'case states',{'wheel-turning', 'power'},...
                            'case values',{'yes' 'on'},...
                            'case outcome','working',...
                            'match percent',80);

newCase.state  = {'wheel-turning', 'power', 'torque-command'};
newCase.values = {'yes','on','no'};
newCase.outcome = '';

[newCase.outcome, pMatch] = CBREngine( newCase, system );

fprintf(1,'New case outcome: %s\n\n',newCase.outcome);

fprintf(1,'Case ID Name                           Percentage Match\n');
for k = 1:length(pMatch)
  fprintf(1,'Case %d: %-30s %4.0f\n',k,system.case(k).name,pMatch(k)*100);
end
