import std.stdio;
import std.file;
import std.datetime

SysTime CalculateExpirationDate(string duration)
{

}

void AddNewFileData2List(string fileName,SysTime expirationDate)
{
    //data format: filename,date
    auto f=File("~/temporary/.stored-file-list","a");
    f.write(args[2]+",");

    //add expiration date
    f.write(expirationDate.year+"/"+expirationDate.month+"/"+expirationDate.day+"\n");
}


int main(string[] args)
{
    //check the existence of storeing folder
    if(!exists("~/temporary"))
        mkdir("~/temporary");

    //check the existence of file list file
    if(!exists("~/temporary/.stored-file-list"))
    {
        //info file doesnt exist

        //Create a new file and write datas to the new file
        auto f=File("~/temporary/.stored-file-list","w");

        //search all pre-stored files and add them to the new list file(default:stored period is 1 month)
        auto file=File("~/temporary","w");
        foreach(string fileName,dirFiles("~/temporary")){
            AddNewFileData2List(fileName,CalculateExpirationDate(arg[3]));
        }
    }
        
    //info file exists

    //Add the data about the new file
    AddNewFileData2List(args[2],args[3]);

    //move the new file to ~/temporary
    execute(["mv",arg[2],"~/temporary"]);

    
    //check expiration dates
    foreach(string fileName,dirFiles("~/temporary")){
        auto currentTime= Clock.currTime();
        //compare the date
    }
}