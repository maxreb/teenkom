#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
WORKDIR /src
COPY ["Caiju.TeenKom.TK3/Caiju.TeenKom.TK3.csproj", "Caiju.TeenKom.TK3/"]
RUN dotnet restore "Caiju.TeenKom.TK3/Caiju.TeenKom.TK3.csproj"
COPY . .
WORKDIR "/src/Caiju.TeenKom.TK3"
RUN dotnet build "Caiju.TeenKom.TK3.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Caiju.TeenKom.TK3.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Caiju.TeenKom.TK3.dll"]