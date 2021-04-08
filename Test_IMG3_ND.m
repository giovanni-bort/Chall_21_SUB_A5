%test_IMG3_ND

load ECG2_12
K_pass_sample=4; K_pass_leads=0.25;

leads_ok=12;

%  ECG2=ECGfull(:,[7 8 9 10 11 12 5 1 2 6 3 4]);
NN=size(ECG2,1); 
NN=input('n_samples: [ECG] ');
if(isempty(NN)),NN=size(ECG2,1);end
T_1b=toc;
fprintf('size: %6.0f%6.0f  pass_sample:%6.0f   pass_leas=%6.2f ',size(ECG2),K_pass_sample,K_pass_leads);
fprintf('   size_NN=%6.0f \n',NN);
k=0;XX=[];VV2=[];
for i_I1=1:NN
    for J=1:leads_ok
        k=k+1;
        XX(k,1)=i_I1;
        XX(k,2)=J;
       VV2(k,1)=ECG2(i_I1,J);
    end
end
T_2b=toc;
 [X1 , Y1]= ndgrid(1:NN, 1:leads_ok);
 Z1 = ECG2(1:NN,:);
% surf(X1,Y1,Z1);
 F_F = griddedInterpolant(X1,Y1,Z1);
[XM,YM]=ndgrid(1:2:NN,0.5:0.1:12.5);
 VVq=F_F(XM,YM);
 IM3=imagesc(VVq);
 
%  [Xm,Ym] = meshgrid(1:K_pass:NN, 0.5:0.1:12.5);
% % %  [Xm,Ym] = meshgrid(1:K_pass_sample:NN, 0.5:K_pass_leads:leads_ok+0.5);
% % %  T_3b=toc;
% % %  EXTRM='nearest';
% % % F1=scatteredInterpolant(XX,VV2);
% % % F1.Method='linear';
% % % F1.ExtrapolationMethod=EXTRM;
% % % T_4b=toc;
% % % % VVq=F1(Xm,Ym);
% % % T_5b=toc;
% % % % IM3=imagesc(VVq);
% % %  k_jet=256;
% % % %  im = ind2rgb(im2uint8(rescale(IM3.CData)),jet(k_jet)); %(128));
% % % % % %  imwrite(imresize(im,[224 224]),'NEWIMAGE2.jpg');
% % % T_6b=toc;
% % %  
% % %   
% % %  opt_QUAL=75;
% % %  file_00X='pippo';
% % %     imFileName = [file_00X '.jpg'];
%      imwrite(imresize(im,[224 224]),fullfile(imgLoc,imFileName),'quality',opt_QUAL);
%     fprintf('IMG2:   %s ',imFileName); fprintf(' %s ',ECG_CINC.diagn{:}); fprintf(' %3.0f ',ECG_CINC.ind_diagn); fprintf('\n');

  
%   imwrite(imresize(im,[224 224]),fullfile(imgLoc,imFileName));
%   fprintf('IMG:   %s ',imFileName); fprintf(' %6s ',LABELS(ii).diagn{:}); fprintf(' %3.0f ',LABELS(ii).ind_diagn); 
%   fprintf(' n=%6.0f',NN);
T_2=toc;
%fprintf(' t:%8.1f  mean:%8.1f',T_2-T_1,T_2/(ii-K_ini+1))
     fprintf(' ---elapsed time: %10.4f',T_2-T_2b);
     fprintf(' -->');
  %   fprintf('%10.3f',T_2b-T_1b,T_3b-T_2b,T_4b-T_3b,T_5b-T_4b,T_6b-T_5b,T_2-T_6b);
     fprintf('\n');
