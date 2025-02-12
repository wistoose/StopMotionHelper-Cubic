
MOD.Name = "Pose parameters";

function MOD:Save(entity)

    local data = {};

    local count = entity:GetNumPoseParameters();
    for i = 0, count - 1 do
        local name = entity:GetPoseParameterName(i);
        data[name] = entity:GetPoseParameter(name);
    end

    return data;

end

function MOD:Load(entity, data)

    for name, value in pairs(data) do
        entity:SetPoseParameter(name, value);
    end

end

function MOD:OrganizeData(args)
    local data = args.data

    local tposes = {}

    for _, subtable in ipairs(data) do

        for name, value in pairs(subtable) do
            if not tposes[name] then
                tposes[name] = {}
            end
            table.insert(tposes[name], value)
        end
    end

    return tposes
end

function MOD:LoadBetween(entity, data1, data2, percentage)

    for name, value in pairs(data2.Keydata) do

        entity:SetPoseParameter(name, SMH.LerpLinear(data2.Frames, value, percentage));

    end

end
