#pragma once
#include "TransputerModel.h"
#include "ITransputerModel.h"


class SimpleTopologyParam:public ITransputerParam
{
protected:
	Dictionary dict;
	int GetIndex(const std::string& name)
	{
		for(int i=0;i<(int)dict.size();i++)
		{
			if(dict[i].first==name)
				return i;
		}
		return -1;
	}
	bool SetText(int id,std::string& val)
	{
		if(id<0 || id>=(int)dict.size())
			return false;
		dict[id].second = val;
		return true; 
	}
public:
	
	SimpleTopologyParam()
	{	
		dict.push_back(std::pair<std::string,std::string>(VIRTUAL_CHANELS,"1"));
	}
	virtual int GetCount(){return (int)dict.size();}
	virtual bool GetValue(const std::string& name,std::string& value)
	{
		return GetValue(GetIndex(name),value);
	}
	virtual bool GetValue(int num,std::string& value)
	{
		if(num<0 || num>=(int)dict.size())
		{
			value="";
			return false;
		}
		value = dict[num].second;
		return true;
	}
	virtual bool SetValue(const std::string& name,std::string& value)
	{
		if(name == VIRTUAL_CHANELS)	
		{
			if(value!="1" && value !="0")
				return false;
			return SetText(GetIndex(name),value);
		}
		return SetText(GetIndex(name),value);
	};
	virtual bool SetValue(int num,std::string& value)
	{
		return SetValue(dict[num].first,value);
	}
	virtual void SetValues(Dictionary& params)
	{
		for(int i=0;i<(int)params.size();i++)
		{
			SetValue(params[i].first,params[i].second);
		}
	}
	virtual void GetValues(Dictionary& params)
	{
		params = dict;
	}
	virtual bool GetName(int num,std::string& name)
	{
		if(num<0 || num>=(int)dict.size())
		{
			name ="";
			return false;
		}
		name = dict[num].first;
		return true;
	}
	virtual int GetTopology(){return SIMPLE_TOPOLOGY;};
};

class CircleTopologyParam:public SimpleTopologyParam
{
public:
	CircleTopologyParam()
	{
		dict.push_back(std::pair<std::string,std::string>(TRANSPUTER_COUNT,"4"));
	}
	virtual bool SetValue(const std::string& name,std::string& value)
	{
		if(name == VIRTUAL_CHANELS)	
		{
			if(value!="1" && value !="0")
				return false;
			return SetText(GetIndex(name),value);
		}
		if(name == TRANSPUTER_COUNT)	
		{
			int cnt;char c;
			if(sscanf(value.c_str(),"%d%c",&cnt,&c)!=1)
				return false;
			if(cnt<3||cnt>100)
				return false;
			return SetText(GetIndex(name),value);
		}
		return SetText(GetIndex(name),value);
	};
	virtual int GetTopology(){return CIRCLE_TOPOLOGY;};
};

class TorTopologyParam:public SimpleTopologyParam
{
public:
	TorTopologyParam()
	{
		dict.push_back(std::pair<std::string,std::string>(GRID_HEIGHT,"2"));
		dict.push_back(std::pair<std::string,std::string>(GRID_WIDTH,"2"));
	}
	virtual bool SetValue(const std::string& name,std::string& value)
	{
		if(name == VIRTUAL_CHANELS)	
		{
			if(value!="1" && value !="0")
				return false;
			return SetText(GetIndex(name),value);
		}
		if(name == GRID_HEIGHT)	
		{
			int cnt;char c;
			if(sscanf(value.c_str(),"%d%c",&cnt,&c)!=1)
				return false;
			if(cnt<2||cnt>10)
				return false;
			return SetText(GetIndex(name),value);
		}
		if(name == GRID_WIDTH)	
		{
			int cnt;char c;
			if(sscanf(value.c_str(),"%d%c",&cnt,&c)!=1)
				return false;
			if(cnt<2||cnt>10)
				return false;
			return SetText(GetIndex(name),value);
		}
		return SetText(GetIndex(name),value);
	}
	virtual int GetTopology(){return TOR_TOPOLOGY;}
};

class StarTopologyParam:public CircleTopologyParam
{	
public:
	virtual int GetTopology(){return STAR_TOPOLOGY;};
	virtual bool SetValue(const std::string& name,std::string& value)
	{
		if(name == VIRTUAL_CHANELS)	
		{
			if(value!="1" && value !="0")
				return false;
			return SetText(GetIndex(name),value);
		}
		if(name == TRANSPUTER_COUNT)	
		{
			int cnt;char c;
			if(sscanf(value.c_str(),"%d%c",&cnt,&c)!=1)
				return false;
			if(cnt<4||cnt>100)
				return false;
			return SetText(GetIndex(name),value);
		}
		return SetText(GetIndex(name),value);
	};
};
