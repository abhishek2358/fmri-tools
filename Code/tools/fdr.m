#! /usr/bin/octave -qusage_message = "Usage: fdr <input file> [--mask <mask file>] [--vol <volume number>] [<output file>]";disp(usage_message);disp("Creates a fdr corrected file with -log(q-values)(to the base 10) using the <input file> which contains -log(p-values) (to the base 10) for the voxels (nagative values are permitted and signs are copied onto output q-values). If no mask or threshold is specified then only the non-zero voxels in the input are considered for testing, others are ignored. In case mast file is specified, voxels with non-zero values in the mask file are used for testing. In case the <input file> contains multiple volumes, all the volumes are assumed to be p-values and are converted to q-values if --vol option is not given. If --vol option is used then only the specified <volume number> is converted from p-values to q-values, the rest of the volumes are copied to the output.");arg_list = argv();if length(arg_list)<2  disp('Not Enough Input Arguments!');  disp(usage_message);endifinput_file = arg_list{1};mask_file = '';volume_number = -1;output_file = '';mask_index = find(arg_list=='--mask');if length(mask_index)!=0  disp('Using Mask File: ');  disp(arg_list(mask_index+1));endifvolume_index = find(arg_list=='--vol');if length(volume_index)!=0  disp('Using Volume Number: ');  disp(arg_list(volume_index+1));endifoutput_file = arg_list(end);disp('Using Output File:');disp(output_file);