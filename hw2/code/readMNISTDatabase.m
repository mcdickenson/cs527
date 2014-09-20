function [train, test] = readMNISTDatabase(dir)

train = readFiles(dir, 'train');
test = readFiles(dir, 't10k');

    function data = readFiles(dir, basename)
        iMagic = 2051;
        lMagic = 2049;
        iSuffix = '-images-idx3-ubyte';
        lSuffix = '-labels-idx1-ubyte';
        iName = sprintf('%s/%s%s', dir, basename, iSuffix);
        lName = sprintf('%s/%s%s', dir, basename, lSuffix);
        data.image = readMNISTFile(iName, iMagic, false);
        data.label = readMNISTFile(lName, lMagic, true);
        
        function data = readMNISTFile(filename, magic, islabel)
            fp = fopen(filename, 'r', 'b');
            if fp < 0
                error('Cannot open file %s', filename);
            end
            
            [m, count] = fread(fp, 1, 'uint32=>unit32');
            if count ~= 1
                error('Failed to read magic number from file %s', filename);
            end
            if (m ~= magic)
                error('Wrong magic number %d (%d expected) in file %s', ...
                    m, magic, filename);
            end
            
            [n, count] = fread(fp, 1, 'uint32=>unit32');
            if count ~= 1
                error('Failed to read number of items from file %s', filename);
            end
            
            if islabel
                rows = 1;
                cols = 1;
            else
                rows = fread(fp, 1, 'uint32=>unit32');
                cols = fread(fp, 1, 'uint32=>unit32');
            end
            
            bytes = n * rows * cols;
            [data, count] = fread(fp, bytes, 'uint8=>uint8');
            if count ~= bytes
                if count == 1
                    suffix = '';
                else
                    suffix = 's';
                end
                error('Read %d byte%s instead of expected %d from file %s', ...
                    count, suffix, bytes, filename);
            end
            
            
            fclose(fp);
            
            if islabel
                data = data';
            else
                data = permute(reshape(data, rows, cols, n), [2 1 3]);
            end
        end
    end
end